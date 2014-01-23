class Lists
  class << self
    def customers
      Customer.scoped.map{|cust| [cust.full_name, cust.id]}
    end

    def currencies
      %w(usd gbp eur inr)
    end
  end
end