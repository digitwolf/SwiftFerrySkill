//
//  WSDOTService.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 2/18/17.
//
//

import Foundation
import SwiftyJSON
import KituraRequest
import LoggerAPI

public class WSDOTService {
    var key: String
    
    init() {
        self.key = "2d1dbff1-4218-4e8b-b832-e6599db7919b"
    }
    
    init(key: String) {
        self.key = key
    }
    
    public func get(path: String,
                    method: String,
                    completionHandler: @escaping (JSON) -> Void)
    {
        let url = "http://www.wsdot.wa.gov/ferries/api/\(path)/rest/\(method)?apiaccesscode=\(self.key)"
        Log.debug("WSDOT Request: \(url)")
        
        KituraRequest.request(.get, url).response {
            request, response, data, error in
            
            
            // Parse data into JSON
            let json = JSON(data: data!)
            Log.debug(json.debugDescription)
            // Callback
            completionHandler(json)
        }
    }
}
