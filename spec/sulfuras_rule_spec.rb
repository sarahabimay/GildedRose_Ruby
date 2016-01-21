require "sulfuras_rule"

describe SulfurasRule do
  before(:each) do
    @rules = SulfurasRule.new
    @item_name = "Sulfuras, Hand of Ragnaros"
  end
  it "only applies rules to 'sulfuras' items" do
    item = Item.new(@item_name, 5, 5)
    expect(@rules.applicable_to?(item)).to eql(true)
  end

  it "update has no effect on sell in value or quality" do
    item = Item.new(@item_name, 5, 5)
    @rules.update_item(item)
    expect(item.sell_in).to eql(5)
    expect(item.quality).to eql(5)
  end
end
