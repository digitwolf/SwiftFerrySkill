//
//  ScheduleService.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 4/14/17.
//
//

import Foundation

//public class ScheduleService : WSDOTService {
//    public override init() {
//        super.init(key: "2d1dbff1-4218-4e8b-b832-e6599db7919b")
//    }
//    
//    func scheduleToday(completionHandler: @escaping ([ScheduleToday]) -> Void) {
//        self.get(path: "schedule",
//                 method: "scheduletoday",
//                 completionHandler: { json in
//                    var result: [ScheduleToday] = []
//                    
//                    for obj in json.arrayValue {
//                        result.append(TerminalBasics(obj))
//                    }
//                    
//                    completionHandler(result)
//        })
//    }
//}
