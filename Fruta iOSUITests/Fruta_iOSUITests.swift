//
//  Fruta_iOSUITests.swift
//  Fruta iOSUITests
//
//  Created by Hugo Landines on 01/10/24.
//  Copyright © 2024 Apple. All rights reserved.
//

import XCTest
import Foundation

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
        
        //Launching app
        let app = XCUIApplication()
        app.launch()
        
        //Waiting time to continue
        Thread.sleep(forTimeInterval: 1)
        
        //Variables
        var image = app.images["image-berry-blue"]
        var title = app.staticTexts["title-berry-blue"]
        var ingredient = app.staticTexts["ingredients-berry-blue"]
        var calorie = app.staticTexts["energy-berry-blue"]
        
        
        //NOTE: Smoothie title for Piña y Coco is set as "Piña yCoco" in the list, therefore the test will pass; once you set it correctly as "Piña y Coco", it will fail as it's meant to according the exercise requirement.
        let titlesList1 : [String] = ["Berry Blue", "Carrot Chops", "Hulking Lemonade", "Kiwi Cutie", "Lemonberry", "Love You Berry Much", "Mango Jambo", "One in a Melon"]
        let titlesList2 : [String] = ["Papa's Papaya", "Peanut Butter Cup", "Piña yCoco", "Sailor Man", "That's a Smore!", "That's Berry Bananas!", "Tropical Blue"]
        
        let ingredientsList1 : [String] = ["Ingredients: Orange, blueberry, and avocado.", "Ingredients: Orange, carrot, and mango.", "Ingredients: Lemon, spinach, and avocado.", "Ingredients: Kiwi, orange, and spinach.", "Ingredients: Raspberry, strawberry, and lemon.", "Ingredients: Strawberry, blueberry, and raspberry.", "Ingredients: Mango and pineapple.", "Ingredients: Watermelon and raspberry."]
        let ingredientsList2: [String] = ["Ingredients: Orange, mango, and papaya.", "Ingredients: Almond Milk, banana, chocolate, and peanut butter.", "Ingredients: Pineapple, almond milk, and coconut.", "Ingredients: Orange and spinach.", "Ingredients: Almond Milk, coconut, and chocolate.", "Ingredients: Almond Milk, banana, and strawberry.", "Ingredients: Almond Milk, banana, blueberry, and mango."]
        
        let caloriesList1 : [String] = ["520 Calories", "230 Calories", "170 Calories", "210 Calories", "140 Calories", "210 Calories", "140 Calories", "130 Calories"]
        let caloriesList2 : [String] = ["210 Calories", "460 Calories", "320 Calories", "170 Calories", "240 Calories", "580 Calories", "490 Calories"]
        
        let ids1 : [String] = ["berry-blue", "carrot-chops", "hulking-lemonade", "kiwi-cutie", "lemonberry", "love-you-berry-much", "mango-jambo", "one-in-a-melon"]
        let ids2 : [String] = ["papas-papaya", "peanut-butter-cup", "pina-y-coco", "sailor-man", "thats-a-smore", "thats-berry-bananas", "tropical-blue"]
        
        for i in 0..<ids1.count{
            
            var image = app.images["image-\(ids1[i])"]
            var title = app.staticTexts["title-\(ids1[i])"]
            var ingredient = app.staticTexts["ingredients-\(ids1[i])"]
            var calorie = app.staticTexts["energy-\(ids1[i])"]
            
            XCTAssertNotNil(image)
            XCTAssertEqual(title.label, titlesList1[i])
            XCTAssertEqual(ingredient.label, ingredientsList1[i])
            XCTAssertEqual(calorie.label, caloriesList1[i])
            
        }
        
        app.swipeUp()
        //Print debug descriptions for objects
        print(app.debugDescription)
        Thread.sleep(forTimeInterval: 1)
        
        for i in 0..<ids2.count{
            var image = app.images["image-\(ids2[i])"]
            var title = app.staticTexts["title-\(ids2[i])"]
            var ingredient = app.staticTexts["ingredients-\(ids2[i])"]
            var calorie = app.staticTexts["energy-\(ids2[i])"]
            
            XCTAssertNotNil(image)
            XCTAssertEqual(title.label, titlesList2[i])
            XCTAssertEqual(ingredient.label, ingredientsList2[i])
            XCTAssertEqual(calorie.label, caloriesList2[i])
            
        }
        
        app.swipeUp()
        //Print debug descriptions for objects
        //print(app.debugDescription)
        
    }
    
    @MainActor
    
    func testExercise2() throws {
        
        //Launching app
        let app = XCUIApplication()
        app.launch()
        
        //Waiting time to continue
        Thread.sleep(forTimeInterval: 1)
        
        let button1 = app.buttons["hulking-lemonade"]
        XCTAssertTrue(button1.exists)
        button1.tap()
        app.swipeUp()
        let label1 = app.staticTexts["description-hulking-lemonade"]
        XCTAssertTrue(label1.exists)
        XCTAssertEqual(label1.label, "This is not just any lemonade. It will give you powers you'll struggle to control!")
        print(app.debugDescription)
        
        let targetLabel = "Menu"
        let allButtons = app.buttons.allElementsBoundByIndex
        for button in allButtons {
            if button.exists && button.label == targetLabel && button.identifier.isEmpty {
                button.tap()
            }
        }
        Thread.sleep(forTimeInterval: 1)
        
        app.swipeUp()
        app.swipeUp()
        
        Thread.sleep(forTimeInterval: 1)
        
        let button2 = app.buttons["tropical-blue"]
        XCTAssertTrue(button2.exists)
        button2.tap()
        app.swipeUp()
        let label2 = app.staticTexts["description-tropical-blue"]
        XCTAssertTrue(label2.exists)
        XCTAssertEqual(label2.label, "A delicious blend of tropical fruits and blueberries will have you sambaing around like you never knew you could!")
        
        Thread.sleep(forTimeInterval: 1)
        
    }
    
    @MainActor
    
    func testExercise3() throws {
        
        //Launching app
        let app = XCUIApplication()
        app.launch()
        
        //Waiting time to continue
        Thread.sleep(forTimeInterval: 1)
        
        //Favorite button
        let heartButton = app.buttons["Favorites"]
        XCTAssertTrue(heartButton.exists)
        heartButton.tap()
        
        Thread.sleep(forTimeInterval: 1)
        
        let favorites = app.staticTexts["empty-favorites-message"]
        XCTAssertEqual(favorites.label, "Add some smoothies to your favorites!")
        
        Thread.sleep(forTimeInterval: 1)
        
        let menuButton = app.buttons["Menu"]
        XCTAssertTrue(menuButton.exists)
        menuButton.tap()
        Thread.sleep(forTimeInterval: 1)
        
        let IDs : [String] = ["berry-blue", "carrot-chops", "hulking-lemonade", "kiwi-cutie", "lemonberry", "love-you-berry-much", "mango-jambo", "one-in-a-melon", "papas-papaya", "peanut-butter-cup", "pina-y-coco", "sailor-man", "thats-a-smore", "thats-berry-bananas", "tropical-blue"]
        let staticIDs : [String] = ["berry-blue", "carrot-chops", "hulking-lemonade", "kiwi-cutie", "lemonberry", "love-you-berry-much", "mango-jambo"]
        let swipeIDs : [String] = ["one-in-a-melon", "papas-papaya", "peanut-butter-cup", "pina-y-coco", "sailor-man", "thats-a-smore", "thats-berry-bananas"]
        let bananaID : [String] = ["thats-berry-bananas"]
        
        if let randomItem = IDs.randomElement() {
            let item = randomItem
            if staticIDs.contains(item) {
                let smoothie = app.buttons["\(randomItem)"]
                smoothie.tap()
                let favorite = app.buttons["favorite-button-\(item)"]
                favorite.tap()
                let targetLabel = "Menu"
                let allButtons = app.buttons.allElementsBoundByIndex
                for button in allButtons {
                    if button.exists && button.label == targetLabel && button.identifier.isEmpty {
                        button.tap()
                        heartButton.tap()
                        XCTAssertTrue(smoothie.exists)
                    }
                }
            }else if swipeIDs.contains(item){
                app.swipeUp()
                let smoothie = app.buttons["\(randomItem)"]
                smoothie.tap()
                let favorite = app.buttons["favorite-button-\(item)"]
                favorite.tap()
                let targetLabel = "Menu"
                let allButtons = app.buttons.allElementsBoundByIndex
                for button in allButtons {
                    if button.exists && button.label == targetLabel && button.identifier.isEmpty {
                        button.tap()
                        heartButton.tap()
                        XCTAssertTrue(smoothie.exists)
                    }
                }
            }else{
                app.swipeUp()
                app.swipeUp()
                let smoothie = app.buttons["\(randomItem)"]
                smoothie.tap()
                let favorite = app.buttons["favorite-button-\(item)"]
                favorite.tap()
                let targetLabel = "Menu"
                let allButtons = app.buttons.allElementsBoundByIndex
                for button in allButtons {
                    if button.exists && button.label == targetLabel && button.identifier.isEmpty {
                        button.tap()
                        heartButton.tap()
                        XCTAssertTrue(smoothie.exists)
                    }
                }
            }
        } else {
            print("The array is empty.")
            
        }
    }
    @MainActor
    func testExercise4() throws {
        
        //Launching app
        let app = XCUIApplication()
        app.launch()
        
        //Waiting time to continue
        Thread.sleep(forTimeInterval: 1)
        print(app.debugDescription)
        
        let smoothies : [String] = ["berry-blue", "carrot-chops", "hulking-lemonade", "kiwi-cutie", "lemonberry", "love-you-berry-much", "mango-jambo", "one-in-a-melon", "papas-papaya", "peanut-butter-cup", "pina-y-coco", "sailor-man", "thats-a-smore", "thats-berry-bananas", "tropical-blue"]
        let imagesList : [String] = ["Berry Blue", "Carrot Chops", "Hulking Lemonade", "Kiwi Cutie", "Lemonberry", "Love You Berry Much", "Mango Jambo", "One in a Melon", "Papa's Papaya", "Peanut Butter Cup", "Piña yCoco", "Sailor Man", "That's a Smore!", "That's Berry Bananas!", "Tropical Blue"]
        let titlesList : [String] = ["Berry Blue", "Carrot Chops", "Hulking Lemonade", "Kiwi Cutie", "Lemonberry", "Love You Berry Much", "Mango Jambo", "One in a Melon", "Papa's Papaya", "Peanut Butter Cup", "Piña yCoco", "Sailor Man", "That's a Smore!", "That's Berry Bananas!", "Tropical Blue"]
        let ingredientsList : [String] = ["Ingredients: Orange, blueberry, and avocado.", "Ingredients: Orange, carrot, and mango.", "Ingredients: Lemon, spinach, and avocado.", "Ingredients: Kiwi, orange, and spinach.", "Ingredients: Raspberry, strawberry, and lemon.", "Ingredients: Strawberry, blueberry, and raspberry.", "Ingredients: Mango and pineapple.", "Ingredients: Watermelon and raspberry.", "Ingredients: Orange, mango, and papaya.", "Ingredients: Almond Milk, banana, chocolate, and peanut butter.", "Ingredients: Pineapple, almond milk, and coconut.", "Ingredients: Orange and spinach.", "Ingredients: Almond Milk, coconut, and chocolate.", "Ingredients: Almond Milk, banana, and strawberry.", "Ingredients: Almond Milk, banana, blueberry, and mango."]
        let caloriesList : [String] = ["520 Calories", "230 Calories", "170 Calories", "210 Calories", "140 Calories", "210 Calories", "140 Calories", "130 Calories", "210 Calories", "460 Calories", "320 Calories", "170 Calories", "240 Calories", "580 Calories", "490 Calories"]
        
        
        
        let allSearchFields = app.searchFields.allElementsBoundByIndex
        for searchField in allSearchFields {
            if searchField.exists && searchField.placeholderValue == "Search" {
                XCTAssertTrue(searchField.isHittable, "Found empty search field is not hittable")
                searchField.tap()
                searchField.typeText("orange")
                //print(app.debugDescription)
                
                for i in 0..<smoothies.count{
                    if ingredientsList[i].contains("orange") || ingredientsList[i].contains("Orange"){
                        let img = app.images["image-\(smoothies[i])"]
                        let tit = app.staticTexts["title-\(smoothies[i])"]
                        let ing = app.staticTexts["ingredients-\(smoothies[i])"]
                        let cal = app.staticTexts["energy-\(smoothies[i])"]
                        
                        XCTAssertEqual(img.label, imagesList[i])
                        XCTAssertEqual(tit.label, titlesList[i])
                        XCTAssertEqual(ing.label, ingredientsList[i])
                        XCTAssertEqual(cal.label, caloriesList[i])
                        print(i)
                        
                    }
                }
            }
        }
    }
    
    
    
    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
}
