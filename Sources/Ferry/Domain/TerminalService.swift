//
//  TerminalService.swift
//  Kitura-Starter
//
//  Created by Babych, Ruslan on 2/16/17.
//
//

import Foundation
import SwiftyJSON

public class TerminalService : WSDOTService {
    public init() {
        super.init(key: "2d1dbff1-4218-4e8b-b832-e6599db7919b")
    }
}

public class WSDOTService {
    var key: String = "2d1dbff1-4218-4e8b-b832-e6599db7919b"
    
    init(key: String) {
        self.key = key
    }
    
    public func get(path: String,
                    method: String,
                    completionHandler: @escaping (JSON) -> Void)
    {
        print("http://www.wsdot.wa.gov/ferries/api/\(path)/rest/\(method)")
        
//        let parameters: Parameters = ["apiaccesscode": key]
//        Alamofire
//            .request("http://www.wsdot.wa.gov/ferries/api/\(path)/rest/\(method)", parameters: parameters)
//            .validate(statusCode: 200..<300)
//            .validate(contentType: ["application/json"])
//            .downloadProgress(closure: { (Progress) in
//                print(Progress.fractionCompleted)
//            })
//            .responseJSON { response in
//                switch response.result {
//                case .success:
//                    print("Validation Successful")
//                case .failure(let error):
//                    print(error)
//                }
//                
//                
//                print(response.request!)  // original URL request
//                print(response.response!) // HTTP URL response
//                print(response.data!)     // server data
//                print(response.result)   // result of response serialization
//                    
//                let json = JSON(response.result.value!)
//                completionHandler(json);
//        }
    }
}
