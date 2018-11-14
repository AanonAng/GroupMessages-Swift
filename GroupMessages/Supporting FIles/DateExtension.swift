//
//  DateExtension.swift
//  GroupMessages
//
//  Created by Aaron Ang on 07/11/2018.
//  Copyright © 2018 AaronAng. All rights reserved.
//

import Foundation

extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }
}
