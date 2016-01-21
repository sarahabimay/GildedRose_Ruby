require_relative "rule_base"

class StandardRule < RuleBase 
  def applicable_to?(item)
    true
  end

  def update_item(item) 
    if (quality_above_minimum?(item))     
       update_quality(item)
    end
    update_sell_in(item)
    if (sell_by_date_exceeded?(item) && quality_above_minimum?(item))
       update_quality(item)
    end
  end
  
  def update_quality(item)
     decrement_quality_by_one(item)
  end
  def update_sell_in(item)
    decrement_sell_in_by_one(item)
  end
end

