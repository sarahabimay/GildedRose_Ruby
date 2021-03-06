require "aged_brie"

describe AgedBrieRule do
  let! (:each) do
    @rules = AgedBrieRule.new
    @item_name = "Aged Brie"
  end

  it "only applies rules to 'aged brie' items" do
    item = Item.new(@item_name, 5, 5);
    expect(@rules.applicable_to?(item)).to eql(true)
  end

  context "update quality and sell_in according to rule" do 
    it "quality above maximum value" do
      item = Item.new(@item_name, 5, 51)
      @rules.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(51)
    end

    it "sell_in days remaining and valid quality" do
      item = Item.new(@item_name, 5, 5)
      @rules.update_item(item)
      expect(item.sell_in).to eql(4)
      expect(item.quality).to eql(6)
    end

    it "exceed sell by date and valid quality" do
      item = Item.new(@item_name, 0, 5)
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(7)
    end
    
    it "exceed sell by date and invalid quality" do
      item = Item.new(@item_name, 0, 51)
      @rules.update_item(item)
      expect(item.sell_in).to eql(-1)
      expect(item.quality).to eql(51)
    end
  end
end
