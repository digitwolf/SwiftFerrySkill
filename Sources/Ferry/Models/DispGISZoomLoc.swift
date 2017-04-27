//
//  DispGISZoomLoc.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 4/14/17.
//
//

import Foundation
import SwiftyJSON

public class DispGISZoomLoc{
    public var zoomLevel : Int? = 0 // The GIS zoom level.
    public var latitude : Double? = 0.0 // The terminal's latitude for this GIS zoom level.
    public var longitude : Double? = 0.0 // The terminal's longitude for this GIS zoom level.
    
    init() {
        
    }
    
    public init(_ json: JSON) {
        zoomLevel = json["ZoomLevel"].intValue
        latitude = json["Latitude"].doubleValue
        longitude = json["Longitude"].doubleValue
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        json["ZoomLevel"].intValue = zoomLevel!
        json["Latitude"].doubleValue = latitude!
        json["Longitude"].doubleValue = longitude!
        return json
    }
    
}
