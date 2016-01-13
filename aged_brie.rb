require_relative "rules_base"

class AgedBrieRule < RulesBase

  def applicable_to?(item)
    "Aged Brie".eql?(item.name)
  end

  def update_item(item)
    if (quality_below_maximum?(item))
      increment_quality_by_one(item)
    end
    decrement_sell_in_by_one(item)
    if (sell_by_date_exceeded?(item) && quality_below_maximum?(item))
      increment_quality_by_one(item)
    end
  end
end
