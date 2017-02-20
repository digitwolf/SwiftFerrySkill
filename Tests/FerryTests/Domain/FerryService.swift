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
    
    func testgetWaitingTime() {
        let ferry = FerryService()
        let from = ferry.getFerry(ferry: "Seattle")
        let to = ferry.getFerry(ferry: "Bainbridge island")
        let message = ferry.getWaitingTime(from: from!, to: to!)
        XCTAssertNotNil(message)
        print(message)
    }
    
    func testgetAvailableSpace() {
        let ferry = FerryService()
        let space = ferry.getAvailableSpace(terminalId: 3, terminalTo: 7)
        XCTAssertNotNil(space)
        print(space)
    }

}
