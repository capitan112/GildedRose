import Foundation

protocol GildedRoseProtocol {
    var item: Item { get }
}

class ParentGildedRose: GildedRoseProtocol {
    internal var _item: Item
    var item: Item {
        return _item
    }

    init(item: Item) {
        _item = item
    }
}

class AgedBrie: ParentGildedRose {
    override var item: Item {
        _item.decreaseSellIn()
        _item.increaseQuality()
        if _item.sellIn < 0 {
            _item.increaseQuality()
        }
        return _item
    }
}

class Backstage: ParentGildedRose {
    override var item: Item {
        _item.decreaseSellIn()

        _item.increaseQuality()
        if _item.sellIn < 11 {
            _item.increaseQuality()
        }

        if _item.sellIn < 6 {
            _item.increaseQuality()
        }

        if _item.sellIn < 0 {
            _item.setQualityToZero()
        }

        return _item
    }
}

class Sulfuras: ParentGildedRose {}

class CommonGildedRose: ParentGildedRose {
    override var item: Item {
        _item.decreaseSellIn()
        _item.decreaseQuality()

        if _item.sellIn < 0 {
            _item.decreaseQuality()
        }

        return _item
    }
}

class ConjuredManaCake: ParentGildedRose {
    override var item: Item {
        _item.decreaseQuality()
        _item.decreaseQuality()

        if _item.sellIn < 0 {
            _item.decreaseQuality()
            _item.decreaseQuality()
        }

        return _item
    }
}
