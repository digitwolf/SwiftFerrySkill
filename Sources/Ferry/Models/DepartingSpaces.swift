//
//  DepartingSpaces.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/3/17.
//
//

import Foundation
import SwiftyJSON

public class DepartingSpaces {
    public var departure : Date? = Date()
    public var isCancelled : Bool? = false
    public var vesselID : Int? = 0
    public var vesselName : String? = ""
    public var maxSpaceCount : Int? = 0
    public var spaceForArrivalTerminals : [SpaceForArrivalTerminals] = []

init() {
    
}

public init(_ json: JSON) {
    departure = Date.init(jsonDate: json["Departure"].stringValue)!
    isCancelled = json["IsCancelled"].boolValue
    vesselID = json["VesselID"].intValue
    vesselName = json["VesselName"].stringValue
    maxSpaceCount = json["MaxSpaceCount"].intValue
    for space in json["SpaceForArrivalTerminals"].arrayValue {
        spaceForArrivalTerminals.append(SpaceForArrivalTerminals.init(space))
    }
}

public func toJson() -> JSON {
    var json = JSON([])
    json["Departure"].double = departure?.timeIntervalSince1970
    json["IsCancelled"].boolValue = isCancelled!
    json["VesselID"].intValue = vesselID!
    json["VesselName"].stringValue = vesselName!
    json["MaxSpaceCount"].intValue = maxSpaceCount!
    var arrivals: [SpaceForArrivalTerminals] = []
    for space in spaceForArrivalTerminals {
        arrivals.append(space)
    }
    json["SpaceForArrivalTerminals"] = JSON(arrivals)
    return json
    }
}
