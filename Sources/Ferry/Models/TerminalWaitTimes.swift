//
//  File.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 2/20/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalWaitTimes {
    public var terminalID : Int? = 0
    public var terminalSubjectID : Int? = 0
    public var regionID : Int? = 0
    public var terminalName : String? = ""
    public var terminalAbbrev : String? = ""
    public var sortSeq : Int? = 0
    public var waitTimes : [WaitTime] = []
    init() {
        
    }
    
    public init(_ json: JSON) {
        terminalID = json["TerminalID"].intValue
        terminalSubjectID = json["TerminalSubjectID"].intValue
        regionID = json["RegionID"].intValue
        terminalName = json["TerminalName"].stringValue
        terminalAbbrev = json["TerminalAbbrev"].stringValue
        sortSeq = json["SortSeq"].intValue
        for jsonTime in json["WaitTimes"].arrayValue {
            waitTimes.append(WaitTime.init(jsonTime))
            
        }
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        
        json["TerminalID"].intValue = terminalID!
        json["TerminalSubjectID"].intValue = terminalSubjectID!
        json["RegionID"].intValue = regionID!
        json["TerminalName"].stringValue = terminalName!
        json["TerminalAbbrev"].stringValue = terminalAbbrev!
        json["SortSeq"].intValue = sortSeq!
        var times: [WaitTime] = []
        for time in waitTimes {
             times.append(time)
        }
        json["WaitTimes"] = JSON(times)
        
        return json
    }
    
}
