require_relative "rule_base"

class AgedBrieRule < RuleBase

  def applicable_to?(item)
    "Aged Brie".eql?(item.name)
  end

  def update_item(item)
    if (quality_below_maximum?(item))
      update_quality(item)
    end
    update_sell_in(item)
    if (sell_by_date_exceeded?(item) && quality_below_maximum?(item))
      update_quality(item)
    end
  end

  def update_quality(item)
      increment_quality_by_one(item)
  end

  def update_sell_in(item)
    decrement_sell_in_by_one(item)
  end
end
