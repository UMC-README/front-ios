//
//  DateFormattter+Extension.swift
//  Readme
//
//  Created by Subeen on 8/10/24.
//

import Foundation

extension DateFormatter {
    static let customFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy.MM.dd"
        return formatter
    }()
}
