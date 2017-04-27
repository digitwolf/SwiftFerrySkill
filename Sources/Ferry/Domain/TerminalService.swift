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
    
    func terminalbasics(completionHandler: @escaping ([TerminalBasics]) -> Void) {
        self.get(path: "terminals",
                 method: "terminalbasics",
                 completionHandler: { json in
                    var result: [TerminalBasics] = []
                    
                    for obj in json.arrayValue {
                        result.append(TerminalBasics(obj))
                    }
                    
                    completionHandler(result)
        })
    }
    
    func terminallocations(completionHandler: @escaping ([TerminalLocations]) -> Void) {
        self.get(path: "terminals",
                 method: "terminallocations",
                 completionHandler: { json in
                    var result: [TerminalLocations] = []
                    for obj in json.arrayValue {
                        result.append(TerminalLocations(obj))
                    }
                    completionHandler(result)
        })
    }
    
    func terminallocations(terminalID: String, completionHandler: @escaping ([TerminalLocations]) -> Void) {
        self.get(path: "terminals",
                 method: "terminallocations/\(terminalID)",
            completionHandler: { json in
                var result: [TerminalLocations] = []
                for obj in json.arrayValue {
                    result.append(TerminalLocations(obj))
                }
                completionHandler(result)
        })

    }
    
    func terminalwaittimes(completionHandler: @escaping (TerminalWaitTimes) -> Void) {
        self.get(path: "terminals",
                 method: "terminalwaittimes",
            completionHandler: { json in
                var result: TerminalWaitTimes = TerminalWaitTimes()
                result = TerminalWaitTimes.init(json)
                completionHandler(result)
        })
        
    }
    
    func terminalwaittimes(terminalID: String, completionHandler: @escaping (TerminalWaitTimes) -> Void) {
        self.get(path: "terminals",
                method: "terminalwaittimes/\(terminalID)",
                completionHandler: { json in
                var result: TerminalWaitTimes = TerminalWaitTimes()
                result = TerminalWaitTimes.init(json)
                completionHandler(result)
        })

    }
    
    func terminalsailingspace
        (terminalID: String, completionHandler: @escaping (TerminalSailingSpace) -> Void) {
        self.get(path: "terminals",
                method: "terminalsailingspace/\(terminalID)",
                completionHandler: { json in
                var result: TerminalSailingSpace = TerminalSailingSpace()
                result = TerminalSailingSpace.init(json)
                completionHandler(result)
                
            })
    }
    
    // provides helpful information for terminal commuters (including parking notes, vehicle-specific tips, etc). A TerminalID, or unique terminal identifier, may be optionally passed to retrieve a specific terminal.
    func terminaltransports
        (terminalID: String, completionHandler: @escaping (JSON) -> Void) {
        self.get(path: "terminals",
                 method: "terminaltransports/\(terminalID)",
            completionHandler: completionHandler)
    }
}
