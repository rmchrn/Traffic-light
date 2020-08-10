//
//  Traffic_lightTests.swift
//  Traffic lightTests
//
//  Created by Ramcharan Reddy Gaddam on 10/08/20.
//  Copyright © 2020 Ramcharan. All rights reserved.
//

import XCTest
@testable import Traffic_light

class Traffic_lightTests: XCTestCase {
    
    var sut: ViewController?
    
    override func setUp() {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(withIdentifier: "traffic") as? ViewController
    }

    override func tearDown() {
        sut = nil
    }

    func testRedOn() {
        let _ = sut?.view
        sut?.turnOn(type: TrafficLightType.red)
        XCTAssert(sut!.redControl.state == .turnOn)
        XCTAssert(sut!.amberControl.state == .turnOff)
        XCTAssert(sut!.greenControl.state == .turnOff)
    }
    
    func testAmberOn() {
        let _ = sut?.view
        sut?.turnOn(type: TrafficLightType.amber)
        XCTAssert(sut!.redControl.state == .turnOff)
        XCTAssert(sut!.amberControl.state == .turnOn)
        XCTAssert(sut!.greenControl.state == .turnOff)
    }
    
    func testGreenOn() {
        let _ = sut?.view
        sut?.turnOn(type: TrafficLightType.green)
        XCTAssert(sut!.redControl.state == .turnOff)
        XCTAssert(sut!.amberControl.state == .turnOff)
        XCTAssert(sut!.greenControl.state == .turnOn)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
