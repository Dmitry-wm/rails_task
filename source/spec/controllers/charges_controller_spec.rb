require "spec_helper"

describe ChargesController do
  describe "create" do
    it "assigns @teams" do
      customer = FactoryGirl.create(:customer)
      Charge.count.should eq 0
      post :create, charge: {currency: "usd", amount: "100.40", customer_id: customer.id}
      Charge.count.should eq 1
    end
  end
end