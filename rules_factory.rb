class RulesFactory

  def initialize
  end

  def find_rule_for(item)
    if ("Aged Brie".eql?(item.name))
      AgedBrieRule.new
    elsif ("Sulfuras, Hand of Ragnaros".eql?(item.name))
      SulfurasRule.new
    elsif ("Backstage passes to a TAFKAL80ETC concert".eql?(item.name))
      BackstagePassRule.new
    elsif ("Conjured Mana Cake".eql?(item.name))
      ConjuredRule.new
    else 
      StandardRules.new
    end
  end
end
