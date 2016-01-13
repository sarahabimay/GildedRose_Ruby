require_relative "rules_base"

class BackstagePassRule < RulesBase
  def applicable_to?(item) 
    "Backstage passes to a TAFKAL80ETC concert".eql?(item.name)  
  end

  def update_item(item)
    if (quality_below_maximum?(item))
      increment_quality_by_one(item)
      if (item.sell_in < 11)
        increment_quality_by_one(item)
      end
      if (item.sell_in < 6)
        increment_quality_by_one(item)
      end
    end
    decrement_sell_in_by_one(item)

    if (sell_by_date_exceeded?(item))
      reduce_quality_to_zero(item)
    end
  end
end
