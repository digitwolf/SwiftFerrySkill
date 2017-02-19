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
        let terminalServiceLocation = TerminalService()
        terminalServiceLocation.get(path: "terminals",
                            method: "terminallocations",
                            completionHandler: { result in
                                try! response.status(.OK).send(json: result).end()
        })
    }
}
