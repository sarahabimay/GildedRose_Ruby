require "rspec"
require "./conjured_rule.rb"
require "./item.rb"

describe "ConjuredRule" do
  let! (:each) do
    @rule = ConjuredRule.new
    @item_name = "Conjured Mana Cake"
  end

  it "is a conjured item type" do
    item = Item.new(@item_name, 3, 6)
    expect(@rule.applicable_to?(item)).to eq(true)
  end

  context "update quality and sell_in" do
    it "sell by date not exceeded and quality >0" do
      item = Item.new(@item_name, 5, 5)
      @rule.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(3)
    end

    it "sell by date exceeded and quality > 0" do
      item = Item.new(@item_name, 0, 5)
      @rule.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(1)
    end

    it "sell by date exceeded and quality below minimum" do
      item = Item.new(@item_name, 0, 0)
      @rule.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(0)
    end
  end
end
