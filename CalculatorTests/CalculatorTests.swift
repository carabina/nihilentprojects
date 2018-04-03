//
//  CalculatorTests.swift
//  CalculatorTests
//
//  Created by Admin on 12/03/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var vc: ViewController!
    var calculatorObj:CalculatorBrain!
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        vc = storyboard.instantiateInitialViewController() as! ViewController

        calculatorObj = CalculatorBrain.init()
        
    }
    
    override func tearDown() {
      
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testButtonPressedValue(){
        
        if let button = vc.view.viewWithTag(1) as? UIButton{
            
           XCTAssert(button.titleLabel?.text == "1")
            
        }
    }
    
    func testButtonPressedValueDisplay()
    {
        let num1 = vc.view.viewWithTag(9) as! UIButton
        vc.touchDigit(num1)
        
        XCTAssert(vc.digitLabel.text == "9")
        vc.touchDigit(num1)
        XCTAssert(vc.digitLabel.text == "99")
    }
    
    func testBinaryOperation(){
       
        let num1 = vc.view.viewWithTag(1) as! UIButton
        let num2 = vc.view.viewWithTag(2) as! UIButton
        let plus = vc.view.viewWithTag(13) as! UIButton  //+
//        let multi = vc.view.viewWithTag(10) as! UIButton  //*
//        let divide = vc.view.viewWithTag(11) as! UIButton  // /
        let equal = vc.view.viewWithTag(20) as! UIButton //=
        vc.touchDigit(num1)
        vc.performOperation(plus)   //1 + 2
        vc.touchDigit(num2)
        vc.performOperation(equal)
        XCTAssert(vc.digitLabel.text == "3.0")
//
//
//        vc.touchDigit(num1)
//        vc.performOperation(multi)   //1 * 2
//        vc.touchDigit(num2)
//        vc.performOperation(equal)
//        XCTAssert(vc.digitLabel.text == "2.0")
//        
//        vc.touchDigit(num1)
//        vc.performOperation(divide)   //1 / 2
//        vc.touchDigit(num2)
//        vc.performOperation(equal)
//        XCTAssert(vc.digitLabel.text == "0.5")
    }
    
    func testUnaryOperation()
    {
        let num1 = vc.view.viewWithTag(4) as! UIButton
        let sqRoot = vc.view.viewWithTag(15) as! UIButton
        let neg = vc.view.viewWithTag(17) as! UIButton
        vc.touchDigit(num1)
        vc.performOperation(sqRoot)
        XCTAssert(vc.digitLabel.text == "2.0")
        vc.performOperation(neg)
        XCTAssert(vc.digitLabel.text == "-2.0")
    }
    
    func testPiOperation(){
        
        let pi = vc.view.viewWithTag(14) as! UIButton
        vc.performOperation(pi)
        
        XCTAssert(vc.digitLabel.text == "3.14159265358979")
    }
    
    func testTraitCollection(){
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
    }
    
    
    
}
