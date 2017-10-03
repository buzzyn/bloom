class Order < ActiveRecord::Base
  belongs_to :bouquet

  has_many :deliveries

  validates :recipient_name, :delivery_on, :bouquet, :cost, :status, presence: true

  scope :billed, -> { where(status: 'billed') }
  scope :bundled, -> { where(three_month_bundle: true) }
  scope :not_bundled, -> { where(three_month_bundle: false) }

  before_validation :assign_cost, :determined_billed

  def assign_cost
    if bouquet.present?
      if special_delivery
        self.cost = bouquet.price * ( 1 + 2 * 0.9)
      else
        self.cost = bouquet.price
      end
    end
  end

  # This is a method that fakes a 10% failure rate on billing
  def determined_billed
    if chance == 1
      self.status = 'failed'
    else
      self.status = 'billed'
    end
  end

  def chance
    Random.rand(10)
  end
end
