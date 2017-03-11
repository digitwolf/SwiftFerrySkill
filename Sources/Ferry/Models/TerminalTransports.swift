//
//  TerminalTransports.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/3/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalTransports {
    public var terminalID: Int? = 0
    //Identifies this terminal as a unique WSF subject.
    public var terminalSubjectID: Int? = 0
    public var regionID: Int? = 0
    public var terminalName: String? = ""
    public var terminalAbbrev: String? = ""
    public var sortSeq: Int? = 0
    public var parkingInfo: String? = ""
    public var parkingShuttleInfo: String? = ""
    // Tips for commuting to this terminal from the airport.
    public var airportInfo: String? = ""
    // Information about parking-related shuttles that service this terminal.
    public var airportShuttleInfo: String? = ""
    // Information for travelers who plan on taking a motorcycle to this terminal.
    public var motorcycleInfo: String? = ""
    //Information for travelers who plan on taking a truck to this terminal.
    public var truckInfo: String? = ""
    public var bikeInfo: String? = ""
    public var trainInfo: String? = ""
    public var taxiInfo: String? = ""
    // Tips for carpool/vanpools commuting to this terminal
    public var hovInfo: String? = ""
    // Links to transit agencies that service this terminal.
    public var transitLinks: [TransitLinks] = []

    init() {
    }
    
    public init(_ json: JSON) {
        terminalID = json["TerminalID"].intValue
        terminalSubjectID = json["TerminalSubjectID"].intValue
        regionID = json["RegionID"].intValue
        terminalName = json["TerminalName"].stringValue
        terminalAbbrev = json["TerminalAbbrev"].stringValue
        sortSeq = json["SortSeq"].intValue
        parkingInfo = json["ParkingInfo"].stringValue
        parkingShuttleInfo = json["ParkingShuttleInfo"].stringValue
        airportInfo = json["AirportInfo"].stringValue
        airportShuttleInfo = json["AirportShuttleInfo"].stringValue
        motorcycleInfo = json["MotorcycleInfo"].stringValue
        truckInfo = json["TruckInfo"].stringValue
        bikeInfo = json["BikeInfo"].stringValue
        trainInfo = json["TrainInfo"].stringValue
        taxiInfo = json["TaxiInfo"].stringValue
        hovInfo = json["HovInfo"].stringValue
        for link in json["TransitLinks"].arrayValue {
            transitLinks.append(TransitLinks.init(link))
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
        json["ParkingInfo"].stringValue = parkingInfo!
        json["ParkingShuttleInfo"].stringValue = parkingShuttleInfo!
        json["AirportInfo"].stringValue = airportInfo!
        json["AirportShuttleInfo"].stringValue = airportShuttleInfo!
        json["MotorcycleInfo"].stringValue = motorcycleInfo!
        json["TruckInfo"].stringValue = truckInfo!
        json["BikeInfo"].stringValue = bikeInfo!
        json["TrainInfo"].stringValue = trainInfo!
        json["TaxiInfo"].stringValue = taxiInfo!
        json["HovInfo"].stringValue = hovInfo!
        var links: [TransitLinks] = []
        for link in transitLinks {
            links.append(link)
        }
        json["TransitLinks"] = JSON(json)
        
        return json
    }
    
}

