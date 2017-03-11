//
//  TerminalSailingSpace.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/3/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalSailingSpace {
    public var terminalID : Int? = 0
    public var terminalSubjectID : Int? = 0
    public var regionID : Int? = 0
    public var terminalName : String? = ""
    public var terminalAbbrev : String? = ""
    public var sortSeq : Int? = 0
    // The most recent departures leaving this terminal.
    public var departingSpaces : [DepartingSpaces] = []
    public var isNoFareCollected : Bool? = false
    public var noFareCollectedMsg : String? = ""
    
    init() {
        
    }
    
    public init(_ json: JSON) {
        terminalID = json["TerminalID"].intValue
        terminalSubjectID = json["terminalSubjectID"].intValue
        regionID = json["RegionID"].intValue
        terminalName = json["TerminalName"].stringValue
        terminalAbbrev = json["TerminalAbbrev"].stringValue
        sortSeq = json["SortSeq"].intValue
        for space in json["DepartingSpaces"].arrayValue {
            departingSpaces.append(DepartingSpaces.init(space))
        }
        isNoFareCollected = json["IsNoFareCollected"].boolValue
        noFareCollectedMsg = json["NoFareCollectedMsg"].stringValue
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        
        json["TerminalID"].intValue = terminalID!
        json["TerminalSubjectID"].intValue = terminalSubjectID!
        json["RegionID"].intValue = regionID!
        json["TerminalName"].stringValue = terminalName!
        json["TerminalAbbrev"].stringValue = terminalAbbrev!
        json["SortSeq"].intValue = sortSeq!
        var spaces: [DepartingSpaces] = []
        for space in departingSpaces {
            spaces.append(space)
        }
        json["DepartingSpaces"] = JSON(spaces)
        json["IsNoFareCollected"].boolValue = isNoFareCollected!
        json["NoFareCollectedMsg"].stringValue = noFareCollectedMsg!
        
        return json
    }
}
