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
            return "There is no information about waiting time for this route"
        }
        let time = String(describing: waitingTime[waitingKey]?.waitTimeLastUpdated)
        return " on " + time + " " + String(describing: waitingTime[waitingKey]?.waitTimeIVRNotes)
    }
    
    // return waiting time for a given terminal id to destination terminal ID
    func getWaitingTime(from: Int) -> String? {
        var waitingTime = self.initWaitingTime(from: from)
        let fromCity = self.getTerminalName(terminalID: from)
        let waitingKey = fromCity!
        guard waitingTime[waitingKey] != nil else {
            return "There is no information about waiting time for this route"
        }
        let time = String(describing: waitingTime[waitingKey]?.waitTimeLastUpdated)
        return " on " + time + " " + String(describing: waitingTime[waitingKey]?.waitTimeIVRNotes)
        
    }
    
    // return the available space for given
    func getAvailableSpace(terminalId: Int, terminalTo: Int) -> String? {
        var availableSpace : Dictionary<String, [AvailableSpace]?> = [:]
        terminalService.terminalsailingspace(terminalID: String(terminalId)) { res in
            for terminal in res.departingSpaces {
                for spaceArrival in terminal.spaceForArrivalTerminals {
                   for i in 0 ..< spaceArrival.arrivalTerminalIDs.count {
                    let key = String(spaceArrival.arrivalTerminalIDs[i])
                    let space = AvailableSpace()
                    space.departingId = terminalId
                    space.departureDate = terminal.departure
                    space.driveUpSpaceCount = spaceArrival.driveUpSpaceCount
                    space.arrivalId = spaceArrival.arrivalTerminalIDs[i]
                    var arr: [AvailableSpace] = []
                    
                    if (availableSpace[key] == nil) {
                      availableSpace[key] = arr
                    }
                    arr = (availableSpace[key])!!
                    arr.append(space)
                    availableSpace[key] = arr
                    }
                }
            }
        }
        
        let sp = availableSpace[String(terminalTo)]
        let first = availableSpace[String(terminalTo)]??.first?.driveUpSpaceCount
        guard sp != nil && first != nil else{
                return "There is no information about this route's available space"
        }
        return "The remaining drive-up space available on the vessel is " + String(describing: first)
    }

}
