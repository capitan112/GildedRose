//
//  ComandLineTemplateTest.swift
//  ComandLineTemplateTest
//
//  Created by Oleksiy Chebotarov on 08/06/2019.
//  Copyright © 2019 Oleksiy Chebotarov. All rights reserved.
//
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
        Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]
    
    //    var sut: Result!
    override func setUp() {
        app = GildedRose(items: items)
    }
    
    override func tearDown() {
        app = nil
    }
    
    
    func getOutput(days: Int) -> String {
        var output = ""
        
        for i in 0..<days {
            output += "-------- day \(i) --------"
            output += "\nname, sellIn, quality"
            for item in items {
                output += "\n\(item)"
            }
            output += "\n"
            app.updateQuality();
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
}
