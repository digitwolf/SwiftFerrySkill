//
//  FerryService.swift
//  FerrySkill
//
//  Created by Babych, Ruslan on 2/18/17.
//
//

import Foundation
import Dispatch
import SwiftyJSON

class FerryService {
    
    let terminalService = TerminalService()
    
    // return Ferry ID from terminal name
    func getFerry(ferry: String) -> Int? {
        let semaphore = DispatchSemaphore(value: 0)
        var terminals : JSON?
        
        terminalService.terminalbasics { res in
            terminals = res
            semaphore.signal()
        }
        
        semaphore.wait()
        
        var ferryId : Int?
        
        let ferryName = ferry.lowercased().trimmingCharacters(in: .illegalCharacters)
        
        for terminal in (terminals?.array)! {
            let name = terminal.dictionaryValue["TerminalName"]?.string?.lowercased().trimmingCharacters(in: .illegalCharacters)
            print(name!)
            if (name == ferryName) {
                ferryId = terminal.dictionaryValue["TerminalID"]?.number?.intValue
            }
        }
        return ferryId
        
    }
    
    // return waiting time
    func getWaitingTime(from: Int, to: Int) -> String?  {
        var semaphore = DispatchSemaphore(value: 0)
        semaphore = DispatchSemaphore(value: 0)
        var terminals : JSON?
        terminalService.terminalwaittimes(terminalID: String(describing: from),completionHandler: { res in
            terminals = res
            semaphore.signal()
        })
        
        semaphore.wait()
        
        var notes : String?
        
        for terminal in (terminals?["WaitTimes"].array)! {
            let name = terminal.dictionaryValue["RouteID"]?.intValue
            if (name == (to)) {
                notes = terminal.dictionaryValue["WaitTimeNotes"]?.string
            }
        }
        return notes
    }
    
    func getAvailableSpace(terminalId: Int, terminalTo: Int) -> Int {
        var semaphore = DispatchSemaphore(value: 0)
        semaphore = DispatchSemaphore(value: 0)
        var terminals : JSON?
        terminalService.terminalsailingspace(terminalID: String(terminalId),completionHandler: { res in
            terminals = res
            semaphore.signal()
        })
        semaphore.wait()
        var spaces : Int?
        let terminal = terminals?["DepartingSpaces"][0]["SpaceForArrivalTerminals"]
        let city = terminal["DriveUpSpaceCount"].intValue
            spaces = city
            return spaces!

        return spaces!
    }
}
