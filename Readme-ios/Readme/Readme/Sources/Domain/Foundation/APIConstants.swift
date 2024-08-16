//
//  APIConstants.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation

struct APIConstants{
    static let contentType = "Content-Type"
    static let host = "Host"
    
}

extension APIConstants {
    static var baseHeader: Dictionary<String, String> {
        [
            contentType : APIHeaderManager.shared.contentType,
            host : APIHeaderManager.shared.readmeHost,
        ]
    }
}
