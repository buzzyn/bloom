class Bouquet < ActiveRecord::Base
  has_many :orders
  has_many :deliveries

  validates :name, :price, presence: true
end
