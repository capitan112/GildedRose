
import Foundation

public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    public func updateQuality() {
        for item in items {
            updateItem(item: item)
        }
    }
    
    func age(item: Item) {
        if (item.name == "Sulfuras, Hand of Ragnaros") {
            return
        }
        
        item.decreaseSellIn()
    }
    
    func update(item: Item) {
        if (item.name == "Sulfuras, Hand of Ragnaros") {
            return
        }
        
        item.decreaseQuality()
    }
    
    
    public func updateItem(item: Item) {
        age(item: item)
        
        if (item.name == "Aged Brie") {
            item.increaseQuality()
            if (item.sellIn < 0) {
                item.increaseQuality()
            }
        } else if (item.name == "Backstage passes to a TAFKAL80ETC concert") {
            item.increaseQuality()

            if (item.sellIn < 11) {
                item.increaseQuality()
            }
            
            if (item.sellIn < 6) {
                item.increaseQuality()
            }
            
            if (item.sellIn < 0) {
                item.setQualityToZero()
            }
        } else {
            update(item: item)
            
            if (item.sellIn < 0) {
                update(item: item)
            }
        }

    }
}
