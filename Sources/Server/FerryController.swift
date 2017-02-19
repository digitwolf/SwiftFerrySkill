////
////  FerryController.swift
////  Kitura-Starter
////
////  Created by Babych, Ruslan on 2/16/17.
////
////
//
import Foundation
import Kitura
import SwiftyJSON
import LoggerAPI
import Ferry
import AlexaSkillsKit

public class FerryController {
    /**
     * Handler for getting an application/json response.
     */
    public func getTerminal(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        Log.debug("GET - /json route handler...")
        response.headers["Content-Type"] = "application/json; charset=utf-8"
        
        let terminalService = TerminalService()
        terminalService.get(path: "terminals",
                            method: "terminalbasics",
                            completionHandler: { result in
                                try! response.status(.OK).send(json: result).end()
        })
    }
    
    /**
     * Handler for getting an application/json response.
     */
    public func postTerminal(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        var data = Data()
        let _ = try? request.read(into: &data)
        
        response.headers["Content-Type"] = "application/json; charset=UTF-8"
        let requestDispatcher = RequestDispatcher(requestHandler: AlexaSkillHandler())
        requestDispatcher.dispatch(data: data) { result in
            switch result {
            case .success(let data):
                response.send(data: data).status(.OK)
            case .failure(let error):
                response.send(error.message).status(.badRequest)
            }

            next()
        //try response.status(.OK).send(msg).end()
        
        }
//        response.headers["Content-Type"] = "application/json; charset=utf-8"
//        let result = JSON([
//                "version": "1.0",
//                "response": [
//                    "outputSpeech": [
//                        "type": "PlainText",
//                        "text": "Hi",
//                    ]
//                ],
//                "shouldEndSession": true
//            ])
//        try! response.status(.OK).send(json: result).end()
    
    }
}
