require "rspec"
require "./rules_factory.rb"
require "./item.rb"

describe RulesFactory do
  let! (:each) { @rules_factory = RulesFactory.new }

  it "AgedBrie Rule" do
    item = Item.new("Aged Brie", 5, 5)
    rule = @rules_factory.find_rule_for(item)
    expect(rule.class).to eql(AgedBrieRule)
  end

  it "SulfurasRule" do
    item = Item.new("Sulfuras, Hand of Ragnaros", 5, 5)
    rule = @rules_factory.find_rule_for(item)
    expect(rule.class).to eql(SulfurasRule)
  end

  it "BackstagePassRule" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5)
    rule = @rules_factory.find_rule_for(item)
    expect(rule.class).to eql(BackstagePassRule)
  end

  it "Conjured Mana Cake" do
    item = Item.new("Conjured Mana Cake", 3, 6)
    rule = @rules_factory.find_rule_for(item)
    expect(rule.class).to eql(ConjuredRule)
  end
  
  it "StandardRule" do
    item = Item.new("Elixir of the Mongoose", 5, 7)
    rule = @rules_factory.find_rule_for(item)
    expect(rule.class).to eql(StandardRule)
  end

  it "StandardRule for another item" do
    item = Item.new("+5 Dexterity Vest", 10, 20)
    rule = @rules_factory.find_rule_for(item)
    expect(rule.class).to eql(StandardRule)
  end
end
