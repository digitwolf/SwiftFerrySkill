//
//  File.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 2/23/17.
//
//

import Foundation
import SwiftyJSON

public class WaitTime {
    public var routeID : Int? = 0
    public var routeName : String? = ""
    public var waitTimeNotes : String? = ""
    public var waitTimeLastUpdated : Date? = Date()
    //Notes detailing wait time conditions (tailored for text to speech systems)
    public var waitTimeIVRNotes : String? = ""
    
    init() {
        
    }
    
    public init(_ json: JSON) {
        routeID = json["RouteID"].intValue
        routeName = json["RouteName"].stringValue
        waitTimeNotes = json["WaitTimeNotes"].stringValue
        waitTimeLastUpdated = Date.init(jsonDate: json["WaitTimeLastUpdated"].stringValue)!
        waitTimeIVRNotes = json["WaitTimeIVRNotes"].stringValue
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        
        json["RouteID"].intValue = routeID!
        json["RouteName"].stringValue = routeName!
        json["WaitTimeNotes"].stringValue = waitTimeNotes!
        json["WaitTimeLastUpdated"].double = waitTimeLastUpdated?.timeIntervalSince1970
        json["WaitTimeIVRNotes"].stringValue = waitTimeNotes!
        
        return json
    }
}
