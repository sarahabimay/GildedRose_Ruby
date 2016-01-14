
require_relative "rules_base"
require_relative "standard_rules"

class ConjuredRule < StandardRules 
  def applicable_to?(item)
    "Conjured Mana Cake".eql?(item.name)
  end

  def update_quality(item)
   decrement_quality_by_one(item)
   decrement_quality_by_one(item)
  end
end
