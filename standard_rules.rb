require_relative "rules_base"

class StandardRules < RulesBase 
  def applicable_to?(item)
    true
  end

  def update_item(item) 
    if (quality_above_minimum?(item))     
       decrement_quality_by_one(item)
    end
    decrement_sell_in_by_one(item)
    if (sell_by_date_exceeded?(item) && quality_above_minimum?(item))
      decrement_quality_by_one(item)
    end
  end
end

