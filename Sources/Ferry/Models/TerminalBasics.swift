//
//  TerminalBasics.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 2/20/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalBasics: Equatable  {
    public var terminalID : Int? = 0
    public var terminalSubjectID : Int? = 0
    public var regionID : Int? = 0
    public var terminalName : String? = ""
    public var terminalAbbrev : String? = ""
    public var sortSeq : Int? = 0
    public var overheadPassengerLoading : Bool? = false
    public var elevator : Bool? = false
    public var waitingRoom : Bool? = false
    public var foodService : Bool? = false
    public var restroom : Bool? = false
    
    init() {
        
    }
    
    public init(_ json: JSON) {
        terminalID = json["TerminalID"].intValue
        terminalSubjectID = json["TerminalSubjectID"].intValue
        regionID = json["RegionID"].intValue
        terminalName = json["TerminalName"].stringValue
        terminalAbbrev = json["TerminalAbbrev"].stringValue
        sortSeq = json["SortSeq"].intValue
        overheadPassengerLoading = json["OverheadPassengerLoading"].boolValue
        elevator = json["Elevator"].boolValue
        waitingRoom = json["WaitingRoom"].boolValue
        foodService = json["FoodService"].boolValue
        restroom = json["Restroom"].boolValue
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        
        json["TerminalID"].intValue = terminalID!
        json["TerminalSubjectID"].intValue = terminalSubjectID!
        json["RegionID"].intValue = regionID!
        json["TerminalName"].stringValue = terminalName!
        json["TerminalAbbrev"].stringValue = terminalAbbrev!
        json["SortSeq"].intValue = sortSeq!
        json["OverheadPassengerLoading"].boolValue = overheadPassengerLoading!
        json["Elevator"].boolValue = elevator!
        json["WaitingRoom"].boolValue = waitingRoom!
        json["FoodService"].boolValue = foodService!
        json["Restroom"].boolValue = restroom!
        
        return json
    }
    public static func == (lhs: TerminalBasics, rhs: TerminalBasics) -> Bool {
        return lhs.terminalID == rhs.terminalID && lhs.terminalSubjectID == rhs.terminalSubjectID && lhs.regionID == rhs.regionID && lhs.terminalName == rhs.terminalName && lhs.terminalAbbrev == rhs.terminalAbbrev && lhs.sortSeq == rhs.sortSeq && lhs.overheadPassengerLoading == rhs.overheadPassengerLoading && lhs.elevator == rhs.elevator && rhs.waitingRoom == lhs.waitingRoom && rhs.foodService == lhs.foodService && rhs.restroom == lhs.restroom
        
    }
    
}
