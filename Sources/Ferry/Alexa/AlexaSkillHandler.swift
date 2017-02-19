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
        
        let standardResponse = generateResponse(message: "Alexa Skill received intent \(request.intent.name)")
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
