class Customer < ActiveRecord::Base
  has_many :charges
  has_one :charge, ->{ order("amount desc") }
  validates :first_name, :last_name, :email, presence: true

  def full_name
    [first_name, last_name].join(" ")
  end
end
