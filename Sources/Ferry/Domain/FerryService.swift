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
    var terminalsName : Dictionary<String, TerminalBasics> = [:]
    var terminalsId : Dictionary<Int, TerminalBasics> = [:]
    let terminalService = TerminalService()

    init() {
        terminalService.terminalbasics { res in
            for terminal in res {
                self.terminalsName[self.createTerminalKey(name: terminal.terminalName!)] = terminal
                self.terminalsId[terminal.terminalID!] = terminal
            }
        }
    }

    func createTerminalKey(name: String) -> String {
        return name.lowercased().trimmingCharacters(in: .illegalCharacters)
    }
    
    // return terminal ID from terminal name
    func getFerry(ferry: String) -> Int? {
        let route = self.terminalsName[self.createTerminalKey(name: ferry)]?.terminalID
        guard route != nil else {
            return nil
        }
        return route
    }
    
    // return Terminal Name by terminal ID
    func getTerminalName(terminalID: Int) -> String? {
        let terminalName = self.terminalsId[terminalID]?.terminalName
        guard terminalName != nil else {
            return nil
        }
        return terminalName
    }
    
    func initWaitingTime(from: Int) -> Dictionary<String, WaitTime> {
        var waitingTime : Dictionary<String, WaitTime> = [:]
        var key = ""
        terminalService.terminalwaittimes(terminalID: String(from)) { res in
            for terminal in res.waitTimes {
                if (terminal.routeName != nil && terminal.routeName != "") {
                    key = terminal.routeName!
                } else {
                    key = res.terminalName!
                }
                waitingTime[key] = terminal
            }
        }
        return waitingTime
    }
    
    // return waiting time for the Route from to to
    func getWaitingTime(from: Int, to: Int) -> String?  {
        var waitingTime = self.initWaitingTime(from: from)
        let fromCity = self.getTerminalName(terminalID: from)
        let toCity = self.getTerminalName(terminalID: to)
        
        var waitingKey = ""
        if (waitingTime[fromCity! + " / " + toCity!] != nil) {
            waitingKey = fromCity! + " / " + toCity!
        } else {
            waitingKey = fromCity!
        }
        
        guard waitingTime[waitingKey] != nil else {
            return "There is information about waiting time for this route"
        }
        let time = String(describing: waitingTime[waitingKey]?.waitTimeLastUpdated)
        return " on " + time + " " + String(describing: waitingTime[waitingKey]?.waitTimeIVRNotes)
    }
    
    // return waiting time for a given terminal
    func getWaitingTime(from: Int) -> String? {
        var waitingTime = self.initWaitingTime(from: from)
        let fromCity = self.getTerminalName(terminalID: from)
        let waitingKey = fromCity!
        guard waitingTime[waitingKey] != nil else {
            return "There is information about waiting time for this route"
        }
        let time = String(describing: waitingTime[waitingKey]?.waitTimeLastUpdated)
        return " on " + time + " " + String(describing: waitingTime[waitingKey]?.waitTimeIVRNotes)
        
    }
    
//    func getAvailableSpace(terminalId: Int, terminalTo: Int) -> Int? {
//        var availableSpace : Dictionary<String, [DepartingSpaces]> = [:]
//        
//        return available[0].spaceForArrivalTerminals[0].driveUpSpaceCount!
//    }
}
