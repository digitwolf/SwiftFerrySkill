//
//  Utils.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/1/17.
//
//

import Foundation
import XCTest
import LoggerAPI
import HeliumLogger
import SwiftyJSON

@testable import Ferry

class WaitTimeTests: XCTestCase {

    
    override func setUp() {
        super.setUp()
        HeliumLogger.use(LoggerMessageType.debug)
    }
    
    func testDate() {
        //let substring = waitTime.waitTimeLastUpdated
        let dateTime = Date.init(jsonDate: "/Date(1488372219000-0800)/")
        print("date ")
        print(dateTime)
    }
    
}
