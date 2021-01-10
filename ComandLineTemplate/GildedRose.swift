
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
            _ = AgedBrie(item: item).item
        case "Backstage passes to a TAFKAL80ETC concert":
            _ = Backstage(item: item).item
        case "Sulfuras, Hand of Ragnaros":
            _ = Sulfuras(item: item).item
//      new implementation for Conjured Mana Cake
//        case "Conjured Mana Cake":
//            _ = ConjuredManaCake(item: item).item
        default:
            _ = CommonGildedRose(item: item).item
        }
    }
}
