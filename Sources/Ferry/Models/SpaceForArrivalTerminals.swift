//
//  SpaceForArrivalTerminals.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/3/17.
//
//

import Foundation
import SwiftyJSON

public class SpaceForArrivalTerminals {
    public var terminalID : Int? = 0
    public var terminalName : String? = ""
    public var vesselID : Int? = 0
    public var vesselName : String? = ""
    public var displayReservableSpace : Bool? = false
    public var reservableSpaceCount : Int? = 0
    public var reservableSpaceHexColor : String? = ""
    public var displayDriveUpSpace : Bool? = false
    public var driveUpSpaceCount : Int? = 0
    public var driveUpSpaceHexColor : String? = ""
    public var maxSpaceCount : Int? = 0
    public var arrivalTerminalIDs: [Int] = []
    
    init() {
        
    }
    
    public init(_ json: JSON) {
        terminalID = json["TerminalID"].intValue
        terminalName = json["TerminalName"].stringValue
        vesselName = json["VesselName"].stringValue
        vesselID = json["VesselID"].intValue
        displayReservableSpace = json["DisplayReservableSpace"].boolValue
        reservableSpaceCount = json["ReservableSpaceCount"].intValue
        reservableSpaceHexColor = json["ReservableSpaceHexColor"].stringValue
        displayDriveUpSpace = json["DisplayDriveUpSpace"].boolValue
        driveUpSpaceCount = json["DriveUpSpaceCount"].intValue
        driveUpSpaceHexColor = json["DriveUpSpaceHexColor"].stringValue
        maxSpaceCount = json["MaxSpaceCount"].intValue
        for terminal in json["ArrivalTerminalIDs"].arrayValue {
            arrivalTerminalIDs.append(terminal.intValue)
        }
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        
        json["TerminalID"].intValue = terminalID!
        json["TerminalName"].stringValue = terminalName!
        json["VesselName"].stringValue = vesselName!
        json["VesselID"].intValue = vesselID!
        json["DisplayReservableSpace"].boolValue = displayReservableSpace!
        json["ReservableSpaceCount"].intValue = reservableSpaceCount!
        json["ReservableSpaceHexColor"].stringValue = reservableSpaceHexColor!
        json["DisplayDriveUpSpace"].boolValue = displayDriveUpSpace!
        json["DriveUpSpaceCount"].intValue = driveUpSpaceCount!
        json["DriveUpSpaceHexColor"].stringValue = driveUpSpaceHexColor!
        json["MaxSpaceCount"].intValue = maxSpaceCount!
        var terminals: [Int] = []
        for terminal in arrivalTerminalIDs {
            terminals.append(terminal)
        }
        json["ArrivalTerminalIDs"] = JSON(terminals)
        
        return json
    }
}
