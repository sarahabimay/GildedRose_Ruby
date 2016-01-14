require "rspec"
require "./rules_factory.rb"
require "./item.rb"

describe RulesFactory do
  before(:each) do
    @rule_factory = RulesFactory.new
  end

  it "found AgedBrie Rule" do
    item = Item.new("Aged Brie", 5, 5)
    rule = @rule_factory.find_rule_for(item)
    expect(rule.class.name).to eql("AgedBrieRule")
  end

  it "found SulfurasRule" do
    item = Item.new("Sulfuras, Hand of Ragnaros", 5, 5)
    rule = @rule_factory.find_rule_for(item)
    expect(rule.class.name).to eql("SulfurasRule")
  end

  it "found BackstagePassRule" do
    item = Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5)
    rule = @rule_factory.find_rule_for(item)
    expect(rule.class.name).to eql("BackstagePassRule")
  end

  it "found Conjured Mana Cake" do
    item = Item.new("Conjured Mana Cake", 3, 6)
    rule = @rule_factory.find_rule_for(item)
    expect(rule.class.name).to eql("ConjuredRule")
  end
  
  it "found StandardRule" do
    item = Item.new("Elixir of the Mongoose", 5, 7)
    rule = @rule_factory.find_rule_for(item)
    expect(rule.class.name).to eql("StandardRules")
  end

  it "found StandardRule for another item" do
    item = Item.new("+5 Dexterity Vest", 10, 20)
    rule = @rule_factory.find_rule_for(item)
    expect(rule.class.name).to eql("StandardRules")
  end

end
