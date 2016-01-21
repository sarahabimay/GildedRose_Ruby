class RulesFactory

  def initialize
  end

  def find_rule_for(item)
    item_name = item.name
    case item_name
    when "Aged Brie"
      AgedBrieRule.new
    when "Sulfuras, Hand of Ragnaros"
      SulfurasRule.new
    when "Backstage passes to a TAFKAL80ETC concert"
      BackstagePassRule.new
    when "Conjured Mana Cake"
      ConjuredRule.new
    else
      StandardRule.new
    end
  end
end
