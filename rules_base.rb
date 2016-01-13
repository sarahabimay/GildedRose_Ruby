class RulesBase
  def update_item(item)
  end

  def applicable_to?(item)
  end

  def quality_below_maximum?(item)
    item.quality < 50
  end

  def quality_above_minimum?(item)
    item.quality > 0
  end

  def sell_by_date_exceeded?(item)
    item.sell_in < 0 
  end

  def decrement_sell_in_by_one(item)
    item.sell_in = item.sell_in - 1
  end

  def decrement_quality_by_one(item)
    item.quality = item.quality - 1
  end

  def increment_quality_by_one(item)
    item.quality = item.quality + 1
  end

  def reduce_quality_to_zero(item)
    item.quality = 0
  end
end
