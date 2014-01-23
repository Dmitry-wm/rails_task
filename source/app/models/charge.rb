class Charge < ActiveRecord::Base
  belongs_to :customer
  validates :amount, numericality: true
  validates :customer, :amount, :currency, presence: true
  validates :currency, inclusion: { in: Lists.currencies }

  #scope :failed, where(paid: false, refunded: false)
  #scope :succeed, where(paid: true, refunded: false)
  #scope :disputed, where(paid: true, refunded: true)

  class << self
    def failed
      where(paid: false, refunded: false)
    end

    def succeed
      where(paid: true, refunded: false)
    end

    def disputed
      where(paid: true, refunded: true)
    end
  end
end
