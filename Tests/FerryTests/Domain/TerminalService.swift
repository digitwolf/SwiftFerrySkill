//
//  TerminalService.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 2/18/17.
//
//

import Foundation
import XCTest

@testable import Ferry

class TerminalServiceTests: XCTestCase {
    func testGet() {
        let semaphore = DispatchSemaphore(value: 0)
        TerminalService().terminalbasics(completionHandler: { result in
            XCTAssertNotNil(result)
            print(result[0].string)
        
            semaphore.signal()
        })
        semaphore.wait()
    }
    
    func locationGet() {
        let semaphore = DispatchSemaphore(value: 0)
        TerminalService().terminallocations(completionHandler: { result in
            XCTAssertNotNil(result)
            print(result)
            semaphore.signal()
        })
        semaphore.wait()
    }
}
