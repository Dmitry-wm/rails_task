require "spec_helper"
describe "Charges lists", :type => :feature do
  describe "lists presence" do
    before :each do
      visit "/charges"
    end

    it "should have 3 lists total" do
      all("ul").count.should eq 3
    end

    it "should have succeed list" do
      all("ul#succeed").count.should eq 1
    end

    it "should have disputed list" do
      all("ul#disputed").count.should eq 1
    end

    it "should have failed list" do
      all("ul#failed").count.should eq 1
    end
  end

  describe "properly charges count in each column" do
  # as a fact we're testing just seed data

    before :all do
      load "#{Rails.root}/db/seeds.rb"
    end

    before :each do
      visit "/charges"
    end

    it "succeed list should have 10 items and 1 header in succeed list" do
      all("ul#succeed>li").count.should eq 11
    end

    it "failed should have 5 items and 1 header in succeed list" do
      all("ul#failed>li").count.should eq 6
    end

    it "disputed should have 5 items and 1 header in disputed list" do
      all("ul#disputed>li").count.should eq 6
    end

    after :all do
      Customer.delete_all
      Charge.delete_all
    end
  end
end