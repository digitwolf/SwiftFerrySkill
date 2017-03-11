//
//  DateExtension.swift
//  FerrySkill
//
//  Created by Shakenova, Galiya on 3/1/17.
//
//

import Foundation

extension Date {
        init?(jsonDate: String) {
            
            let prefix = "/Date("
            let suffix = ")/"
            
            // Check for correct format:
            guard jsonDate.hasPrefix(prefix) && jsonDate.hasSuffix(suffix) else { return nil }
            
            // Extract the number as a string:
            let from = jsonDate.index(jsonDate.startIndex, offsetBy: prefix.characters.count)
            print(from )
            let to = jsonDate.index(jsonDate.endIndex, offsetBy: -(suffix.characters.count + 5))
            print(to )
            // Convert milliseconds to double
            guard let milliSeconds = Double(jsonDate[from ..< to]) else { return nil }
            
            // Create NSDate with this UNIX timestamp
            self.init(timeIntervalSince1970: milliSeconds/1000.0)
        }
}
