require 'date'
require 'util/date_util'
require 'pry'

@complete_status = 'complete'
@special_delivery = 'Special delivery'
@standard_delivery = 'Standard delivery'
@standard_delivery_cost = 2.50

namespace :shipping do
  desc 'Shipping task. Usage: rake shipping:orders DATE=yyyy-mm-dd'
  task :orders => :environment do |t, args|
    if ENV['DATE'].nil?
      puts "Please provide date, ie yyyy-mm-dd"
      return
    end

    @delivery_date = ENV['DATE'].to_date
    @date = DateUtil.new(@delivery_date)

    if !Date.valid_date?(@delivery_date.year, @delivery_date.month, @delivery_date.day) || !@date.present?
      puts "Please enter a valid date, ie yyyy-mm-dd"
      return
    end

    create_two_month_ago_deliveries
    create_one_month_ago_deliveries
    create_today_deliveries
    puts "Shiopping task has been completed"
  end
end

def create_today_deliveries
  orders = order_in_date(@delivery_date)
  orders.billed.select do |order|
    @order = order
    if create_delivery && !order.three_month_bundle
      update_order_status
    end
  end
end

def create_one_month_ago_deliveries
  d = @date.get_one_month_ago_date
  orders = order_in_date(d)
  orders.bundled.billed.select do |order|
    @order = order
    create_delivery
  end
end

def create_two_month_ago_deliveries
  d = @date.get_two_month_ago_date
  orders = order_in_date(d)
  orders.bundled.billed.select do |order|
    @order = order
    if create_delivery
      update_order_status
    end
  end
end

def order_in_date(d)
  Order.where(delivery_on: d)
end

def create_delivery
  @delivery = Delivery.new(delivery_details)
  @delivery.save
end

private

def three_month_bundle?
  true if @order.three_month_bundle
  false
end

def delivery_details
  {
    bouquet_id: @order.bouquet.id,
    recipient_name: @order.recipient_name,
    delivery_date: @delivery_date.to_s,
    order_id: @order.id,
    shipping_method: delivery_method,
    delivery_cost: delivery_cost
  }
end

def delivery_method
  return @order.special_delivery ? @special_delivery : @standard_delivery
end

def delivery_cost
  return delivery_method == @special_delivery ? (@standard_delivery_cost * 2) : @standard_delivery_cost
end

def update_order_status
  @delivery.order.update_attribute(:status, @complete_status)
end
