//
//  Date+extensions.swift
//  FamilyTree
//
//  Created by Дмитрий Мельников on 28.04.2022.
//

import Foundation

extension Date {
    static let future = Date(isoDate: "1/1/2122")
    
    init(isoDate: String) {
        let string = isoDate + "T01:00:00+0000"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd/MM/yyy'T'HH:mm:ssZ"

        self = dateFormatter.date(from:string)!
    }
}
