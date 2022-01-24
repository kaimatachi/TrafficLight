//
//  TrafficLightManagerTests.swift
//  TrafficLightManagerTests
//
//  Created by Jeremy Van Cauteren on 19/01/2022.
//

import XCTest
@testable import TrafficLight

class TrafficLightManagerTests: XCTestCase {
    
    let firstState = TrafficLightState.red


    func testFirstIteration() throws {
        let manager = TrafficLightManager()
        manager.startIterating()
        
        let exp = expectation(description: "Test after X seconds")
        _ = XCTWaiter.wait(for: [exp], timeout: firstState.timeToNextCase)
        
        XCTAssert(firstState.nextState == manager.state.value, "Wrong state encountered")
    }
    
    func testSecondIteration() throws {
        let manager = TrafficLightManager()
        manager.startIterating()
        
        let exp = expectation(description: "Test after X seconds")
        _ = XCTWaiter.wait(for: [exp], timeout: firstState.timeToNextCase + firstState.nextState.timeToNextCase)
        
        XCTAssert(firstState.nextState.nextState == manager.state.value, "Wrong state encountered")
    }
    
    func testStopIterating() {
        let manager = TrafficLightManager()
        manager.startIterating()
        
        let exp = expectation(description: "Test after X seconds")
        _ = XCTWaiter.wait(for: [exp], timeout: firstState.timeToNextCase)
        
        manager.stopIterating()
        
        XCTAssert(firstState.nextState == manager.state.value, "Wrong state encountered")
        
        let exp2 = expectation(description: "Test after X seconds")
        _ = XCTWaiter.wait(for: [exp2], timeout: firstState.nextState.timeToNextCase)
        
        XCTAssert(firstState.nextState == manager.state.value, "Wrong state encountered")
        
    }
    
}
