AgedBrie = 'Aged Brie'
BackStage = 'Backstage passes to a TAFKAL80ETC concert'
Sulfuras = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
		if item.name == Sulfuras
			break
		end
	
    if item.name != AgedBrie && item.name != BackStage
      if item.quality > 0
          item.quality -= 1
      end

    else
      if item.quality < 50
        item.quality += 1
        
				if item.name == BackStage and item.sell_in < 11
            item.quality += 1
						if item.sell_in < 6
							item.quality += 1
						end
				end
				
      end
    end

    item.sell_in -= 1

    if item.sell_in < 0
	
      if item.name == AgedBrie
				if item.quality<50
					item.quality +=1
				end
			else
        if item.name != BackStage and item.quality > 0
          item.quality -= 1
        else
          item.quality = 0
        end
			
     
      end

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

