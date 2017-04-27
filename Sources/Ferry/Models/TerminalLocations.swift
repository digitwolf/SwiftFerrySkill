//
//  TerminalLocations.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 4/14/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalLocations {
    public var terminalId : Int? = 0
    public var terminalSubjectId: Int? = 0
    public var regionId : Int? = 0
    public var terminalName : String? = ""
    public var terminalAbbrev : String? = ""
    public var sortSeq : Int? = 0 // A preferred sort order (sort-ascending with respect to other terminals).
    public var latitude : Double? = 0.0 // The latitude of the terminal.
    public var longitude : Double? = 0.0 // The longitude of the terminal.
    public var addressLineOne : String? = "" // The first line of the terminal's address.
    public var addressLineTwo : String? = "" // The second line of the terminal's address.
    public var city : String? = "" // The city where the terminal is located.
    public var state : String? = "" // The state where the terminal is located.
    public var zipCode : String? = ""  // The terminal's zip code.
    public var country : String? = "" // The country where the terminal is located.
    public var mapLink : String? = "" // A URL to a page that displays the terminal on a GIS map.
    public var directions : String? = "" // Instructions detailing how to drive to the terminal.
    public var dispGISZoomLoc: [DispGISZoomLoc] = [] // Where this terminal should appear on a GIS map (at various zoom levels).
    
    init() {
        
    }
    
    public init(_ json: JSON) {
        terminalId = json["TerminalID"].intValue
        terminalSubjectId = json["TerminalSubjectID"].intValue
        regionId = json["RegionID"].intValue
        terminalName = json["TerminalName"].stringValue
        terminalAbbrev = json["TerminalAbbrev"].stringValue
        sortSeq = json["SortSeq"].intValue
        latitude = json["Latitude"].doubleValue
        addressLineOne = json["AddressLineOne"].stringValue
        addressLineTwo = json["AddressLinetwo"].stringValue
        city = json["City"].stringValue
        state = json["State"].stringValue
        zipCode = json["ZipCode"].stringValue
        country = json["Country"].stringValue
        mapLink = json["MapLink"].stringValue
        directions = json["Directions"].stringValue
        for location in json["DispGISZoomLoc"].arrayValue {
            dispGISZoomLoc.append(DispGISZoomLoc.init(location))
        }
        
        
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        
        json["TerminalID"].intValue = terminalId!
        json["TerminalSubjectID"].intValue = terminalSubjectId!
        json["RegionID"].intValue = regionId!
        json["TerminalName"].stringValue = terminalName!
        json["TerminalAbbrev"].stringValue = terminalAbbrev!
        json["SortSeq"].intValue = sortSeq!
        json["Latitude"].doubleValue = latitude!
        json["AddressLineOne"].stringValue = addressLineOne!
        json["AddressLinetwo"].stringValue = addressLineTwo!
        json["City"].stringValue = city!
        json["State"].stringValue = state!
        json["ZipCode"].stringValue = zipCode!
        json["Country"].stringValue = country!
        json["MapLink"].stringValue = mapLink!
        json["Directions"].stringValue = directions!
        var locations: [DispGISZoomLoc] = []

        for loc in dispGISZoomLoc {
            locations.append(loc)
        }
        json["DispGISZoomLoc"] = JSON(locations)
        return json
    }

    
    
    
}
