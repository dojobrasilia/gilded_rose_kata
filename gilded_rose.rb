AgedBrie = 'Aged Brie'
BackStage = 'Backstage passes to a TAFKAL80ETC concert'
Sulfuras = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
		if item.name == Sulfuras
			break
		end
	
		item.sell_in -= 1
	
    if item.name == AgedBrie
				if item.sell_in < 0
					item.quality += 2
				else
					item.quality += 1
				end
		elsif item.name == BackStage
				if item.sell_in < 5
					item.quality += 3
				elsif item.sell_in < 10
          item.quality += 2
      	else
					item.quality += 1
				end
    else
      item.quality -= 1
    end

    

    if item.sell_in < 0
	
      if item.name == AgedBrie
				
			elsif item.name == BackStage
          item.quality = 0
      else
        item.quality -= 1
      end

    end

		if item.quality > 50
			item.quality = 50
		elsif item.quality < 0
      item.quality = 0
		end
		
  end
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]