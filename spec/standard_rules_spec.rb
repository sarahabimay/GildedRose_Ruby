require './standard_rule.rb'
require './item.rb'
require "rspec"

describe StandardRule do
  let! (:each) do
    @rules = StandardRule.new
  end

  it "is a standard item type" do
      item = Item.new("Standard", 5, 5)
      expect(@rules.applicable_to?(item)).to eql(true)
  end

  context "update quality and sell_in" do 
    it "sell by date not exceeded and quality >0" do
      item = Item.new("Standard", 5, 5)
      @rules.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(4)
    end

    it "exceed sell by date and quality > 0" do
      item = Item.new("Standard", 0, 5)
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(3)
    end

    it "sell by date and quality below minimum" do
      item = Item.new("Standard", 0, 0)
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(0)
    end
  end
end

