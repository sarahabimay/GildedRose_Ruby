require './item.rb'

class GildedRose
  attr_reader :items

  @items = []

  def initialize
    @items = []
    #@items << Item.new("+5 Dexterity Vest", 10, 20)
    #@items << Item.new("Aged Brie", 2, 0)
    #@items << Item.new("Elixir of the Mongoose", 5, 7)
    #@items << Item.new("Sulfuras, Hand of Ragnaros", 0, 80)
    #@items << Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20)
    #@items << Item.new("Conjured Mana Cake", 3, 6)
  end

  def add_item(item)
    @items << item
    puts @item.to_s
  end

  def update_quality
    @items.each do |item|
      if (item.name == "Sulfuras, Hand of Ragnaros")
        non_degrading_item_rules(item)
      elsif (item.name == "Aged Brie") 
        aged_brie_rules(item)
      elsif (item.name == "Backstage passes to a TAFKAL80ETC concert")
        backstage_pass_rules(item)
      else
        standard_item_rules(item)
      end
    end
  end
 
  def non_degrading_item_rules(item)
  end

  def aged_brie_rules(item)
    if (quality_is_below_maximum(item))
      increment_quality_by_one(item)
    end

    decrement_sell_in_by_one(item)

    if (sell_by_date_exceeded(item) && quality_is_below_maximum(item))
      increment_quality_by_one(item)
    end
  end

  def backstage_pass_rules(item)
    if (quality_is_below_maximum(item))
      increment_quality_by_one(item)
      if (item.sell_in < 11)
        if (quality_is_below_maximum(item))
          increment_quality_by_one(item)
        end
      end

      if (item.sell_in < 6)
        if (quality_is_below_maximum(item))
          increment_quality_by_one(item)
        end
      end
    end

    decrement_sell_in_by_one(item)

    if (sell_by_date_exceeded(item))
      reduce_quality_to_zero(item)
    end
  end

  def standard_item_rules(item)
    if (quality_above_minimum(item))
      decrement_quality_by_one(item)
    end

    decrement_sell_in_by_one(item)

    if (sell_by_date_exceeded(item) && quality_above_minimum(item))
      decrement_quality_by_one(item)
    end
  end

  def quality_above_minimum(item)
    item.quality > 0
  end

  def quality_is_below_maximum(item)
    item.quality < 50
  end

  def sell_by_date_exceeded(item)
    item.sell_in < 0
  end

  def decrement_sell_in_by_one(item)
    item.sell_in = item.sell_in - 1 
  end

  def reduce_quality_to_zero(item)
    item.quality = item.quality - item.quality
  end

  def increment_quality_by_one(item)
    item.quality = item.quality + 1
  end

  def decrement_quality_by_one(item)
    item.quality = item.quality - 1
  end
end
