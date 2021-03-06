require 'rule_base'
require 'item'

describe RuleBase do
  let! (:each) { @rule_base = RuleBase.new }

  it "has helper methods common to all rules" do
    expect(RuleBase.method_defined?(:quality_below_maximum?)).to eql(true)
    expect(RuleBase.method_defined?(:quality_above_minimum?)).to eql(true)
    expect(RuleBase.method_defined?(:decrement_sell_in_by_one)).to eql(true)
    expect(RuleBase.method_defined?(:decrement_quality_by_one)).to eql(true)
    expect(RuleBase.method_defined?(:increment_quality_by_one)).to eql(true)
    expect(RuleBase.method_defined?(:reduce_quality_to_zero)).to eql(true)
    expect(RuleBase.method_defined?(:sell_by_date_exceeded?)).to eql(true)
    expect(RuleBase.method_defined?(:applicable_to?)).to eql(true)
    expect(RuleBase.method_defined?(:update_item)).to eql(true)
  end

  it "can check an item's quality is less than 50" do
    item = Item.new("Standard", 5, 49)
    expect(@rule_base.quality_below_maximum?(item)).to eql(true)
  end

  it "can check an item's quality is not less than 50" do
    item = Item.new("Standard", 5, 50)
    expect(@rule_base.quality_below_maximum?(item)).to eql(false)
  end

  it "quality above minimum" do
    item = Item.new("Standard", 5, 5)
    expect(@rule_base.quality_above_minimum?(item)).to eql(true)
  end

  it "decrements sell_in value of item by one" do
    item = Item.new("Standard", 5, 5)
    @rule_base.decrement_sell_in_by_one(item)
    expect(item.sell_in).to eql(4) 
  end

  it "decrements quality by one" do
    item = Item.new("Standard", 5, 5)
    @rule_base.decrement_quality_by_one(item)
    expect(item.quality).to eql(4)
  end

  it "increments quality by one" do
    item = Item.new("Standard", 5, 5)
    @rule_base.increment_quality_by_one(item)
    expect(item.quality).to eql(6)
  end

  it "reduce quality to zero" do
    item = Item.new("Standard", 5, 5)
    @rule_base.reduce_quality_to_zero(item)
    expect(item.quality).to eql(0)
  end

  it "finds a sell by 'date' that has exceeded" do
    item = Item.new("Standard", 0, 5)
    @rule_base.decrement_sell_in_by_one(item)
    expect(@rule_base.sell_by_date_exceeded?(item)).to eql(true)
  end
end
