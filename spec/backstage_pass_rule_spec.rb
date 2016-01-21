require 'backstage_pass_rule'
require 'item'

describe BackstagePassRule do
  let! (:each) do
    @rules = BackstagePassRule.new
    @item_name = "Backstage passes to a TAFKAL80ETC concert"
  end

  it "only applies rules to 'backstage pass' items" do
    item = Item.new(@item_name, 5, 5);
    expect(@rules.applicable_to?(item)).to eql(true)
  end

  context "update quality and sell_in according to rule" do 
    it "quality above maximum value" do
      item = Item.new(@item_name, 5, 51);
      @rules.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(51)
    end

    it "sell_in days greater than 10 and quality less than maximum" do
      item = Item.new(@item_name, 11, 5);
      @rules.update_item(item)
      expect(item.sell_in).to eql(10)
      expect(item.quality).to eql(6)
    end

    it "sell_in days greater than 5 and valid quality" do
      item = Item.new(@item_name, 6, 5);
      @rules.update_item(item)
      expect(item.sell_in).to eql(5)
      expect(item.quality).to eql(7)
    end

    it "sell_in days greater than 0 and valid quality" do
      item = Item.new(@item_name, 5, 5);
      @rules.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(8)
    end

    it "sell_in day is 0 and valid quality" do
      item = Item.new(@item_name, 1, 5);
      @rules.update_item(item)
      expect(item.sell_in).to eql(0)
      expect(item.quality).to eql(8)
    end

    it "exceed sell by date so quality should be reduced to 0" do
      item = Item.new(@item_name, 0, 5);
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(0)
    end
  end
end

