
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

    private func updateItem(item: Item) {
        switch item.name {
        case "Aged Brie":
            _ = AgedBrie(item: item)
        case "Backstage passes to a TAFKAL80ETC concert":
            _ = Backstage(item: item)
        case "Sulfuras, Hand of Ragnaros":
            _ = Sulfuras(item: item)
        default:
            _ = CommonGildedRose(item: item)
        }
    }
}

protocol GildedRoseProtocol {
    var item: Item { get }
}

class AgedBrie: GildedRoseProtocol {
    var item: Item
    
    init(item: Item) {
        self.item = item
        item.decreaseSellIn()
        item.increaseQuality()
        if (item.sellIn < 0) {
            item.increaseQuality()
        }
    }
}

class Backstage: GildedRoseProtocol {
    var item: Item
    init(item: Item) {
        self.item = item
        item.decreaseSellIn()
        
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
    }
}

class Sulfuras: GildedRoseProtocol {
    var item: Item
    init(item: Item) {
        self.item = item
    }
}

class CommonGildedRose: GildedRoseProtocol {
    var item: Item
    init(item: Item) {
        self.item = item
        item.decreaseSellIn()
        item.decreaseQuality()
        
        if (item.sellIn < 0) {
            item.decreaseQuality()
        }
    }
}
