//
//  Fruta_iOSUITests.swift
//  Fruta iOSUITests
//
//  Created by Hugo Landines on 01/10/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import XCTest

final class Fruta_iOSUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    @MainActor
    func testExercise1() throws {
        let app = XCUIApplication()
        app.launch()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        print(app.debugDescription)
        
        let rows = [
            ("berry-blue", "Berry Blue", "Ingredients: Orange, blueberry, and avocado.", "520 kilocalories"),
            ("carrot-chops", "Carrot Chops", "Ingredients: Orange, carrot, and mango.", "230 kilocalories"),
            ("hulking-lemonade", "Hulking Lemonade", "Ingredients: Lemon, spinach, and avocado.", "170 kilocalories"),
            ("kiwi-cutie", "Kiwi Cutie", "Ingredients: Kiwi, orange, and spinach.", "210 kilocalories"),
            ("lemonberry", "Lemonberry", "Ingredients: Raspberry, strawberry, and lemon.", "140 kilocalories"),
            ("love-you-berry-much", "Love You Berry Much", "Ingredients: Strawberry, blueberry, and raspberry.", "210 kilocalories"),
            ("mango-jambo", "Mango Jambo", "Ingredients: Mango and pineapple.", "140 kilocalories"),
            (nil, "SWIPE", "SWIPE", "SWIPE"),
            ("one-in-a-melon", "One in a Melon", "Ingredients: Watermelon and raspberry.", "130 kilocalories"),
            ("papas-papaya", "Papa's Papaya", "Ingredients: Strawberry, blueberry, and raspberry.", "210 kilocalories"),
            ("peanut-butter-cup", "Peanut Butter Cup", "Ingredients: Mango and pineapple.", "140 kilocalories"),
            ("pina-y-coco", "Piña y Coco", "Ingredients: Watermelon and raspberry.", "130 kilocalories"),
            ("sailor-man", "Sailor Man", "Ingredients: Orange, mango, and papaya.", "210 kilocalories"),
            ("thats-a-smore", "That's a Smore!", "Ingredients: Almond Milk, banana, chocolate, and peanut butter.", "460 kilocalories"),
            ("thats-berry-bananas", "That's Berry Bananas!", "Ingredients: Pineapple, almond milk, and coconut.", "320 kilocalories"),
            ("tropical-blue", "Tropical Blue", "Ingredients: Orange and spinach.", "170 kilocalories"),
        ]
        for row in rows {
            if let id = row.0 {
                let image = app.images["image-\(id)"]
                let title = app.staticTexts["title-\(id)"]
                let ingredients = app.staticTexts["ingredients-\(id)"]
                let energy = app.staticTexts["energy-\(id)"]
                XCTAssertNotNil(image)
                XCTAssertNotNil(title)
                XCTAssertNotNil(ingredients)
                XCTAssertNotNil(energy)
                
                let titleText = row.1
                XCTAssertEqual(title.label, titleText)
                
                let ingredientText = row.2
                XCTAssertEqual(ingredients.label, ingredientText)
                
                let energyText = row.3
                XCTAssertEqual(energy.label, energyText)
            } else {
                app.swipeUp()
                _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
                print(app.debugDescription)
            }
        }
    }
    
    
    @MainActor
    func testExercise2() throws {
        let app = XCUIApplication()
        app.launch()
        sleep(1)
        
        let rows = [
            "berry-blue",
            "carrot-chops",
            "hulking-lemonade",
            "kiwi-cutie",
            "lemonberry",
            "love-you-berry-much",
            "mango-jambo",
            nil,
            "one-in-a-melon",
            "papas-papaya",
            "peanut-butter-cup",
            "pina-y-coco",
            "sailor-man",
            "thats-a-smore",
            "thats-berry-bananas",
            "tropical-blue",
        ]
        for row in rows {
            if let id = row {
                
                let button = app.buttons[id]
                button.tap()
                _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
                
                app.swipeUp()
                _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
                
                let description = app.staticTexts["description-\(id)"]
                XCTAssertNotNil(description)
                print(app.debugDescription)
                
                let navigation = app.navigationBars.element(boundBy: 0)
                let back = navigation.buttons.element(boundBy: 0)
                back.tap()
                _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
            } else {
                app.swipeUp()
                _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
            }
        }
    }
    
    
    @MainActor
    func testExercise3A() throws {
        let app = XCUIApplication()
        app.launch()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let favorites = app.buttons["heart.fill"]
        favorites.tap()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let message = app.staticTexts["empty-favorites-message"]
        XCTAssertNotNil(message)
        XCTAssertEqual(message.label, "Add some smoothies to your favorites!")
    }
    
    
    @MainActor
    func testExercise3B() throws {
        let app = XCUIApplication()
        app.launch()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let id = "berry-blue"
        let button = app.buttons[id]
        button.tap()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let favorite = app.buttons["favorite-button-\(id)"]
        favorite.tap()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let navigation = app.navigationBars.element(boundBy: 0)
        let back = navigation.buttons.element(boundBy: 0)
        back.tap()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let favorites = app.buttons["heart.fill"]
        favorites.tap()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        let image = app.images["image-\(id)"]
        let title = app.staticTexts["title-\(id)"]
        let ingredients = app.staticTexts["ingredients-\(id)"]
        let energy = app.staticTexts["energy-\(id)"]
        XCTAssertNotNil(title)
        XCTAssertNotNil(image)
        XCTAssertNotNil(ingredients)
        XCTAssertNotNil(energy)
    }
    
    
    @MainActor
    func testExercise4() throws {
        let app = XCUIApplication()
        app.launch()
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        print(app.debugDescription)
        
        let text = "orange"
        let search = app.searchFields.element(boundBy: 0)
        search.tap()
        search.typeText(text)
        _ = XCTWaiter.wait(for: [expectation(description: "Waiting")], timeout: 0.1)
        
        var textCount = 0
        let predicate = NSPredicate(format: "identifier like \"ingredients*\"")
        let descriptions = app.staticTexts.matching(predicate)
        for i in 0..<descriptions.count {
            let staticText = descriptions.element(boundBy: i)
            if (staticText.label.lowercased().contains(text)) {
                textCount += 1
            }
        }
        XCTAssertEqual(textCount, 5)
        
    }
}
