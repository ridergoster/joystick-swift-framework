//  FWJoystickExempleUITests.swift
//  FWJoystickExempleUITests
//
//  Created by Vincent Durpoix on 15/02/2017.
//  Copyright © 2017 MOC2. All rights reserved.
//

import XCTest

class FWJoystickExempleUITests: XCTestCase {
    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testJoystickCenter() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.5)).tap()
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("CENTER",testLabel.value as! String );
        
    }
    
    func testJoystickUp() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2)).tap()
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("UP",testLabel.value as! String );
    
    }
    
    func testJoystickDown() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.8)).tap()
        
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("DOWN",testLabel.value as! String );
        
    }
    func testJoystickLeft() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.2, dy: 0.5)).tap()
        
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("LEFT",testLabel.value as! String );
        
    }
    
    func testJoystickRight() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.8, dy: 0.5)).tap()
        
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("RIGHT",testLabel.value as! String );
        
    }
    
    func testIsNotTriggered() {
        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.7)).tap()
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("Hello",testLabel.value as! String );
    }
    
    func testBooleanStop(){
        let joystickElement = app.otherElements["joystick"]
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.8, dy: 0.5)).tap()
        
        
        let testLabel = app.textFields["testLabel"]
        
        
        XCTAssertEqual("RIGHT",testLabel.value as! String );
        
        
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2)).tap()

        
        XCTAssertEqual("RIGHT",testLabel.value as! String );
        
        joystickElement.coordinate(withNormalizedOffset: CGVector(dx: 0.5, dy: 0.2)).press(forDuration: 3)
        
        
        XCTAssertEqual("UP",testLabel.value as! String );

    }
    

    
    
}
