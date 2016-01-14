require_relative "rules_base"

class BackstagePassRule < RulesBase
  def applicable_to?(item) 
    "Backstage passes to a TAFKAL80ETC concert".eql?(item.name)  
  end

  def update_item(item)
    if (quality_below_maximum?(item))
      update_quality(item)
      if (item.sell_in < 11)
        update_quality(item)
      end
      if (item.sell_in < 6)
        update_quality(item)
      end
    end
    update_sell_in(item)
    if (sell_by_date_exceeded?(item))
      reduce_quality_to_zero(item)
    end
  end

  def update_quality(item)
      increment_quality_by_one(item)
  end
end
