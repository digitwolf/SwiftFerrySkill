//
//  TerminalService.swift
//  Kitura-Starter
//
//  Created by Babych, Ruslan on 2/16/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalService : WSDOTService {
    public override init() {
        super.init(key: "2d1dbff1-4218-4e8b-b832-e6599db7919b")
    }
    
    func terminalbasics(completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminalbasics",
                 completionHandler: completionHandler)
    }
    
    func terminallocations(completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminallocations",
                 completionHandler: completionHandler)
    }
    
    func terminallocations(terminalID: String, completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminallocations/\(terminalID)",
            completionHandler: completionHandler)
    }
    
    func terminalwaittimes(completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminalwaittimes",
                 completionHandler: completionHandler)
    }
    
    func terminalwaittimes(terminalID: String, completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminalwaittimes/\(terminalID)",
            completionHandler: completionHandler)
    }
    
    func terminalsailingspace
        (terminalID: String, completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminalsailingspace/\(terminalID)",
            completionHandler: completionHandler)
    }
}
