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
            return "http://read-me.kro.kr:8000"
        }
    }
}
