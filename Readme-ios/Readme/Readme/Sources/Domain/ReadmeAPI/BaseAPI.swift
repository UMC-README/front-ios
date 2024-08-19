//
//  ReadmeAPI.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

public enum BaseAPI: String {
    case base
    
    public var apiDesc: String {
        switch self {
        case .base:
//            return "https://read-me.kro.kr"
//            return "http://localhost:8000"
            return "https://read-me.kro.kr"
        }
    }
}
