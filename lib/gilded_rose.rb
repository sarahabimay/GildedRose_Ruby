require 'item'

class GildedRose
  attr_reader :items

  @items = []
  def initialize(rules_factory)
    @items = []
    @rules_factory = rules_factory
    #@items << Item.new("+5 Dexterity Vest", 10, 20)
    #@items << Item.new("Aged Brie", 2, 0)
    #@items << Item.new("Elixir of the Mongoose", 5, 7)
    #@items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    #@items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    #@items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def add_item(item)
    @items << item
    puts @item.to_s
  end

  def update_quality
    @items.each do |item|
      rule = @rules_factory.find_rule_for(item)
      rule.update_item(item)
    end
  end
end
