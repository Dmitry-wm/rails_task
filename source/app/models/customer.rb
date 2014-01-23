class Customer < ActiveRecord::Base
  has_many :charges
  has_one :charge, ->{ order("amount desc") }

  def full_name
    [first_name, last_name].join(" ")
  end
end
