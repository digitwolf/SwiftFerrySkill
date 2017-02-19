//
//  FerryService.swift
//  FerrySkill
//
//  Created by Babych, Ruslan on 2/18/17.
//
//

import Foundation
import XCTest

@testable import Ferry

class FerryServiceTests: XCTestCase {
    func testFerry() {
        let ferry = FerryService()
        ferry.getFerry(from: "Seattle", to: "Bainbridge Island")
    }
}
