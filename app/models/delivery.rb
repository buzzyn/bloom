class Delivery < ApplicationRecord
  belongs_to :bouquet
  belongs_to :order

  validates :recipient_name, :delivery_date, :bouquet, :order, :delivery_cost, presence: true
end