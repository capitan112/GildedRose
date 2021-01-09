import Foundation

public class Item {
    public var name: String
    public var sellIn: Int
    public var quality: Int
    
    public init(name: String, sellIn: Int, quality: Int) {
        self.name = name
        self.sellIn = sellIn
        self.quality = quality
    }
}

extension Item: CustomStringConvertible {
    public var description: String {
        return self.name + ", " + String(self.sellIn) + ", " + String(self.quality);
    }
}

extension Item {
    func increaseQuality() {
        if quality < 50 {
            quality += 1
        }
    }
    
    func decreaseQuality() {
        if quality > 0 {
            quality -= 1
        }
    }
    
    func setQualityToZero() {
        quality = 0
    }
    
    func decreaseSellIn() {
        sellIn -= 1
    }
}
