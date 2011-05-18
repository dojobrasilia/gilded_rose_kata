AgedBrie = 'Aged Brie'
BackStage = 'Backstage passes to a TAFKAL80ETC concert'
Sulfuras = 'Sulfuras, Hand of Ragnaros'

def update_quality(items)
  items.each do |item|
	next if item.name == Sulfuras

	item.sell_in -= 1
	
    if item.name == AgedBrie
		update_aged_brie(item)
	elsif item.name == BackStage
	    update_backstage(item)
    elsif item.name == "Conjured Mana Cake"
        update_conjured(item)
    else
        update_normal_item(item)
    end

	enforce_limits(item)
		
  end
end

def update_aged_brie(item)
    if item.sell_in < 0
		item.quality += 2
	else
		item.quality += 1
	end
end

def update_backstage(item)
    if item.sell_in < 0
	    item.quality = 0
	elsif item.sell_in < 5
		item.quality += 3
	elsif item.sell_in < 10
        item.quality += 2
  	else
		item.quality += 1
	end
end

def update_normal_item(item)
    if item.sell_in < 0
        item.quality -= 2
    else
        item.quality -= 1
    end
end

def update_conjured(item)
    if item.sell_in < 0
        item.quality -= 4
    else
        item.quality -= 2
    end
end

def enforce_limits(item)
    if item.quality > 50
		item.quality = 50
	elsif item.quality < 0
        item.quality = 0
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
