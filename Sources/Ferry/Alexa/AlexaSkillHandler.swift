//
//  AlexaSkillHandler.swift
//  FerrySkill
//
//  Created by Babych, Ruslan on 2/18/17.
//
//

import Foundation
import AlexaSkillsKit

public class AlexaSkillHandler : RequestHandler {
    let ferryService = FerryService()
    
    public init() {}
    
    public func handleLaunch(request: LaunchRequest, session: Session, next: @escaping (StandardResult) -> ()) {
        let standardResponse = generateResponse(message: "Alexa Skill received launch request")
        next(.success(standardResponse: standardResponse, sessionAttributes: session.attributes))
    }
    
    public func handleIntent(request: IntentRequest, session: Session, next: @escaping (StandardResult) -> ()) {
        if (request.intent.name != "GetFerryTime") {
            next(.failure(MessageError(message: "Sorry, I don't support that.")))
            return
        }
        
        guard let from = request.intent.slots["From"]?.value
            else {
                next(.failure(MessageError(message: "Please specify departure city")))
                return
        }
        
        guard let to = request.intent.slots["To"]?.value
            else {
                next(.failure(MessageError(message: "Please specify arrival city")))
                return
        }
        
        let msg = ferryService.getFerry(from: from, to: to) ?? "Sorry, there is no into about this"
        
        
        let standardResponse = generateResponse(message: msg)
        next(.success(standardResponse: standardResponse, sessionAttributes: session.attributes))
    }
    
    public func handleSessionEnded(request: SessionEndedRequest, session: Session, next: @escaping (VoidResult) -> ()) {
        next(.success())
    }
    
    func generateResponse(message: String) -> StandardResponse {
        let outputSpeech = OutputSpeech.plain(text: message)
        return StandardResponse(outputSpeech: outputSpeech)
    }
}
