require './gilded_rose.rb'
require "rspec"

describe GildedRose do
  before(:each) do
    @gilded_rose = GildedRose.new(RulesFactory.new)
  end

  context "when item is age improved" do
    it "increases by one when sell in decreases" do
      @gilded_rose.add_item(Item.new("Aged Brie", 1, 20))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(21) 
    end

    it "increases quality twice as fast once sell by date has passed" do
      @gilded_rose.add_item(Item.new("Aged Brie", 0, 20))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(22) 
      expect(items[0].sell_in()).to eq(-1) 
    end

    it "never has quality > 50" do
      @gilded_rose.add_item(Item.new("Aged Brie", 1, 50))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(50) 
    end
  end

  context "when item is 'Sulfuras, Hand of Ragnaros'" do
    it "never degrades in quality" do
      @gilded_rose.add_item(Item.new("Sulfuras, Hand of Ragnaros", 1, 80))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(80) 
    end
  end

  context "when item is 'Backstage passes to a TAFKAL80ETC concert'" do
    it "improves in quality by 1 when sell_in > 10" do
      @gilded_rose.add_item(Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(21) 
    end

    it "improves in quality by 2 when sell_in > 5" do
      @gilded_rose.add_item(Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 20))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(22) 
    end

    it "improves in quality by 3 when sell_in <= 5" do
      @gilded_rose.add_item(Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 20))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(23) 
    end

    it "never has quality > 50" do
      @gilded_rose.add_item(Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(50) 
    end

    it "has quality of 0 when sell_in is 0" do
      @gilded_rose.add_item(Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 20))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(0) 
    end
  end

  context "when item is a 'standard' item" do
    it "has quality and sell_in reduced by 1" do
      @gilded_rose.add_item(Item.new("+5 Dexterity Vest", 5, 5))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(4) 
      expect(items[0].sell_in()).to eq(4) 
    end

    it "decreases in quality twice as fast once sell by date has passed" do
      @gilded_rose.add_item(Item.new("+5 Dexterity Vest", 0, 5))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].quality()).to eq(3) 
      expect(items[0].sell_in()).to eq(-1) 
    end

    it "never has negative quality" do
      @gilded_rose.add_item(Item.new("Elixir of the Mongoose", 1, 0))
      @gilded_rose.update_quality
      items = @gilded_rose.items
      expect(items[0].sell_in()).to eq(0) 
      expect(items[0].quality()).to eq(0) 
    end
  end
end
