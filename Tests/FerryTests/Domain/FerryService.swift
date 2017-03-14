//
//  FerryService.swift
//  FerrySkill
//
//  Created by Babych, Ruslan on 2/18/17.
//
//

import Foundation
import XCTest
import LoggerAPI
import HeliumLogger

@testable import Ferry

class FerryServiceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        HeliumLogger.use(LoggerMessageType.debug)
    }
    
    func testFerry() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Seattle")
        let to = ferry.getFerry(ferry: "Bainbridge island")
        XCTAssertEqual(from, 7)
        XCTAssertEqual(to, 3)
    }
    
    func testNonExistingFerry() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Moscow")
        XCTAssertEqual(from, nil)
    }
    func testGetCity() {
        let ferry = FerryService()
        print(ferry)
        let from = ferry.getTerminalName(terminalID: 7)
        XCTAssertEqual(from, "Seattle")
    }
    func testgetWaitingTime() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Seattle")
        let to = ferry.getFerry(ferry: "Fauntleroy")
        
        let message = ferry.getWaitingTime(from: from!, to: to!)
        XCTAssertNotNil(message)
        XCTAssertEqual("There is information about waiting time for this route", message)
    }
    func testgetWaitingTimeExistingCity() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Seattle")
        let to = ferry.getFerry(ferry: "Bremerton")
        let message = ferry.getWaitingTime(from: from!, to: to!)
        XCTAssertNotNil(message)
        print("Waiting time from Seattle to Bremerton " + message!)
    }
    
    func testGetWaitingTimeRouteNameNull() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Sidney B.C.")
        let to = ferry.getFerry(ferry: "Bremerton")
        let message = ferry.getWaitingTime(from: from!, to: to!)
        XCTAssertNotNil(message)
        print("Waiting time from Sidney B.C. to Bremerton " + message!)
    }
    
    func testGetWaitingTimeOneCity() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Bainbridge Island")
        let message = ferry.getWaitingTime(from: from!)
        XCTAssertNotNil(message)
        print("Waiting time at Bainbridge Island terminal is " + message!)
    }
    
    func testgetAvailableSpace() {
        let ferry = FerryService()
        let space = ferry.getAvailableSpace(terminalId: 3, terminalTo: 7)
        XCTAssertNotNil(space)
        print("Available space " + String(describing: space))
    }
    
    func testgetAvailableSpaceNoRoute() {
        let ferry = FerryService()
        let space = ferry.getAvailableSpace(terminalId: 20, terminalTo: 7)
        XCTAssertEqual("There is no information about this route\'s available space", space)
    }

}
