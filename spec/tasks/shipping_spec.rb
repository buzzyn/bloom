require 'rails_helper'
require 'spec_helper'
require 'rake'

describe 'shipping:orders' do
  include_context "rake"

  describe "public instance methods" do
    let(:order) do
      mock_model Order, :recipient_name => 'Tester',
                         :bouquet_id => 3,
                         :delivery_on => '2017-09-24',
                         :status => 'billed',
                         :three_month_bundle => false,
                         :special_delivery => true
    end

    it "create deliveries" do
      allow(subject).to receive(:order_in_date).and_return(order)

      ENV['DATE']='2017-09-24'
      subject.invoke
      expect(Delivery.count).to_not eq(0)
    end
  end
end