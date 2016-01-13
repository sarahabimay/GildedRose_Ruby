require './standard_rules.rb'
require './item.rb'
require "rspec"

describe StandardRules do
  before(:each) do
    @rules = StandardRules.new
  end

  it "is a standard item type" do
      item = Item.new("Standard", 5, 5)
      expect(@rules.applicable_to?(item)).to eql(true)
  end

  context "update quality and sellin" do 
    it "sell by date not exceeded and quality >0" do
      item = Item.new("Standard", 5, 5)
      @rules.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(4)
    end

    it "sell by date exceeded and quality > 0" do
      item = Item.new("Standard", 0, 5)
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(3)
    end

    it "sell by date exceeded and quality below minimum" do
      item = Item.new("Standard", 0, 0)
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(0)
    end
  end
end

