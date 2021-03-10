//
//  TickTakGameUITests.swift
//  TickTakGameUITests
//
//  Created by UHS on 08/03/2021.
//

import XCTest

class TickTakGameUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func setUpMatch(){
        let app = XCUIApplication()
        app.textFields["playerOneTextField"].tap()
        app.textFields["playerOneTextField"].typeText("John")
        app.textFields["playerTwoTextField"].tap()
        app.textFields["playerTwoTextField"].typeText("Wick")
        app.buttons["startButton"].tap()
    }
    
    func testTapButtonOne (){
        let app = XCUIApplication()
        let button = app.buttons["buttonOne"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonTwo (){
        let app = XCUIApplication()
        let button = app.buttons["buttonTwo"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }

    func testTapButtonThree (){
        let app = XCUIApplication()
        let button = app.buttons["buttonThree"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonFour (){
        let app = XCUIApplication()
        let button = app.buttons["buttonFour"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonFive (){
        let app = XCUIApplication()
        let button = app.buttons["buttonFive"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonSix (){
        let app = XCUIApplication()
        let button = app.buttons["buttonSix"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonSeven (){
        let app = XCUIApplication()
        let button = app.buttons["buttonSeven"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonEight (){
        let app = XCUIApplication()
        let button = app.buttons["buttonEight"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testTapButtonNine (){
        let app = XCUIApplication()
        let button = app.buttons["buttonNine"]
        button.tap()
        XCTAssertEqual(button.label, "X")
    }
    
    func testPlayerOneWon() {
        let app = XCUIApplication()
        let button = app.buttons["buttonOne"]
        button.tap()
        app.buttons["buttonFive"].tap()
        app.buttons["buttonTwo"].tap()
        app.buttons["buttonSix"].tap()
        app.buttons["buttonThree"].tap()
        
        let alert = app.alerts["Player One Wins!"]
        alert.collectionViews.buttons["Ok"].tap()
        
        XCTAssertEqual(button.label, "")
    }
    
    func testPlayerTwoWon() {
        let app = XCUIApplication()
        let button = app.buttons["buttonOne"]
        button.tap()
        app.buttons["buttonFive"].tap()
        app.buttons["buttonTwo"].tap()
        app.buttons["buttonSix"].tap()
        app.buttons["buttonNine"].tap()
        app.buttons["buttonFour"].tap()
        
        let alert = app.alerts["Player Two Wins!"]
        alert.collectionViews.buttons["Ok"].tap()
        
        XCTAssertEqual(button.label, "")
    }
}
