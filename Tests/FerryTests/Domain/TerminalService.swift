//
//  TerminalService.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 2/18/17.
//
//

import Foundation
import XCTest
import LoggerAPI
import HeliumLogger

@testable import Ferry

class TerminalServiceTests: XCTestCase {
    override func setUp() {
        super.setUp()
        HeliumLogger.use(LoggerMessageType.debug)
    }
    
    func testGet() {
        let semaphore = DispatchSemaphore(value: 0)
        TerminalService().terminalbasics(completionHandler: { result in
            XCTAssertNotNil(result)
        
        
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func testlocationGet() {
        let semaphore = DispatchSemaphore(value: 0)
        TerminalService().terminallocations(completionHandler: { result in
            XCTAssertNotNil(result)
            print(result)
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func testWaitingTimeGet() {
        let semaphore = DispatchSemaphore(value: 0)
        TerminalService().terminalwaittimes(terminalID: "7", completionHandler: { result in
            XCTAssertNotNil(result)
            print(result)
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func testSpaceAvailable() {
        let semaphore = DispatchSemaphore(value: 0)
        TerminalService().terminalsailingspace(terminalID: "3", completionHandler: { result in
            XCTAssertNotNil(result)
            print(result)
            semaphore.signal()
        })
        semaphore.wait()
    }

}
