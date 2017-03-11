//
//  TransitLinks.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/3/17.
//
//

import Foundation
import SwiftyJSON

public class TransitLinks {
    // The URL of the transit link.
    public var linkURL: String? = ""
    // The name of the transit agency.
    public var linkName: String? = ""
    public var sortSeq: String? = ""
    
    init() {
    
    }
    
    public init(_ json: JSON) {
        linkURL = json["LinkURL"].stringValue
        linkName = json["LinkName"].stringValue
        sortSeq = json["SortSeq"].stringValue
    }
    
    public func toJson() -> JSON {
        var json = JSON([])
        json["LinkURL"].stringValue = linkURL!
        json["LinkName"].stringValue = linkName!
        json["SortSeq"].stringValue = sortSeq!
        return json
    }
}
