import XCTest
@testable import ComandLineTemplate

class ClassTemplateTest: XCTestCase {
    var app: GildedRose!
    let items = [
        Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
        Item(name: "Aged Brie", sellIn: 2, quality: 0),
        Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        // this conjured item does not work properly yet
        Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6),
    ]

    //    var sut: Result!
    override func setUp() {
        app = GildedRose(items: items)
    }

    override func tearDown() {
        app = nil
    }

    func getOutput(days: Int) -> String {
        var output = ""

        for i in 0 ..< days {
            output += "-------- day \(i) --------"
            output += "\nname, sellIn, quality"
            for item in items {
                output += "\n\(item)"
            }
            output += "\n"
            app.updateQuality()
        }

        return output
    }

    func testedDays1() {
        let dayOneOutput = getOutput(days: 1)
        XCTAssertEqual(dayOneOutput, resultDay1)
    }

    func testedDays2() {
        let dayTwoOutput = getOutput(days: 2)
        XCTAssertEqual(dayTwoOutput, resultDay2)
    }

    func testedDays3() {
        let dayThreeOutput = getOutput(days: 3)
        XCTAssertEqual(dayThreeOutput, resultDay3)
    }

    func testedDays4() {
        let dayFourOutput = getOutput(days: 4)
        XCTAssertEqual(dayFourOutput, resultDay4)
    }

    func testedDays5() {
        let dayFiveOutput = getOutput(days: 5)
        XCTAssertEqual(dayFiveOutput, resultDay5)
    }

    func testwithTwoItems() {
        let items = [Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
                     Item(name: "Aged Brie", sellIn: 2, quality: 0)]
        let days = 2
        let gildedRose = GildedRose(items: items)

        var outcome = ""
        for _ in 0 ..< days {
            for item in items {
                outcome += item.description + "\n"
            }
            gildedRose.updateQuality()
        }
        XCTAssertEqual("+5 Dexterity Vest, 10, 20\nAged Brie, 2, 0\n+5 Dexterity Vest, 9, 19\nAged Brie, 1, 1\n", outcome)
    }

    func testWithEightItems2Days() {
        let items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        ]

        let days = 2
        let gildedRose = GildedRose(items: items)

        var outcome = ""
        for _ in 0 ..< days {
            for item in items {
                outcome += item.description + "\n"
            }
            gildedRose.updateQuality()
        }

        XCTAssertEqual("+5 Dexterity Vest, 10, 20\nAged Brie, 2, 0\nElixir of the Mongoose, 5, 7\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 15, 20\nBackstage passes to a TAFKAL80ETC concert, 10, 49\nBackstage passes to a TAFKAL80ETC concert, 5, 49\n+5 Dexterity Vest, 9, 19\nAged Brie, 1, 1\nElixir of the Mongoose, 4, 6\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 14, 21\nBackstage passes to a TAFKAL80ETC concert, 9, 50\nBackstage passes to a TAFKAL80ETC concert, 4, 50\n", outcome)
    }

    func testWithEightItems5Dys() {
        let items = [
            Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 20),
            Item(name: "Aged Brie", sellIn: 2, quality: 0),
            Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 0, quality: 80),
            Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
            Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        ]

        let days = 5
        let gildedRose = GildedRose(items: items)

        var outcome = ""
        for _ in 0 ..< days {
            for item in items {
                outcome += item.description + "\n"
            }
            gildedRose.updateQuality()
        }

        XCTAssertEqual("+5 Dexterity Vest, 10, 20\nAged Brie, 2, 0\nElixir of the Mongoose, 5, 7\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 15, 20\nBackstage passes to a TAFKAL80ETC concert, 10, 49\nBackstage passes to a TAFKAL80ETC concert, 5, 49\n+5 Dexterity Vest, 9, 19\nAged Brie, 1, 1\nElixir of the Mongoose, 4, 6\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 14, 21\nBackstage passes to a TAFKAL80ETC concert, 9, 50\nBackstage passes to a TAFKAL80ETC concert, 4, 50\n+5 Dexterity Vest, 8, 18\nAged Brie, 0, 2\nElixir of the Mongoose, 3, 5\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 13, 22\nBackstage passes to a TAFKAL80ETC concert, 8, 50\nBackstage passes to a TAFKAL80ETC concert, 3, 50\n+5 Dexterity Vest, 7, 17\nAged Brie, -1, 4\nElixir of the Mongoose, 2, 4\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 12, 23\nBackstage passes to a TAFKAL80ETC concert, 7, 50\nBackstage passes to a TAFKAL80ETC concert, 2, 50\n+5 Dexterity Vest, 6, 16\nAged Brie, -2, 6\nElixir of the Mongoose, 1, 3\nSulfuras, Hand of Ragnaros, 0, 80\nSulfuras, Hand of Ragnaros, -1, 80\nBackstage passes to a TAFKAL80ETC concert, 11, 24\nBackstage passes to a TAFKAL80ETC concert, 6, 50\nBackstage passes to a TAFKAL80ETC concert, 1, 50\n", outcome)
    }
}
