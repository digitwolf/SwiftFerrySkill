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
    
    func getFerry(from: String, to: String) -> String? {
        var semaphore = DispatchSemaphore(value: 0)
        var terminals : JSON?
        
        terminalService.terminalbasics { res in
            terminals = res
            semaphore.signal()
        }
        
        semaphore.wait()
        
        var fromId : Int?
        var toId : Int?
        
        let fromName = from.lowercased().trimmingCharacters(in: .illegalCharacters)
        let toName = to.lowercased().trimmingCharacters(in: .illegalCharacters)
        
        for terminal in (terminals?.array)! {
            let name = terminal.dictionaryValue["TerminalName"]?.string?.lowercased().trimmingCharacters(in: .illegalCharacters)
            print(name!)
            if (name == fromName) {
                fromId = terminal.dictionaryValue["TerminalID"]?.number?.intValue
            }
            if (name == toName) {
                toId = terminal.dictionaryValue["TerminalID"]?.number?.intValue
            }
        }
        
        semaphore = DispatchSemaphore(value: 0)
        terminalService.terminalwaittimes(terminalID: String(describing: fromId!),completionHandler: { res in
            terminals = res
            semaphore.signal()
        })
        
        semaphore.wait()
        
        var notes : String?
        
        for terminal in (terminals?["WaitTimes"].array)! {
            let name = terminal.dictionaryValue["RouteName"]?.string?.lowercased().trimmingCharacters(in: .illegalCharacters)
            if (name?.contains(toName))! {
                notes = terminal.dictionaryValue["WaitTimeNotes"]?.string
            }
        }
        
        return notes
    }
}
