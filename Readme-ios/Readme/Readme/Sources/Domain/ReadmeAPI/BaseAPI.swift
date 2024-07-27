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
            return "http://52.78.229.147:8000/"
        }
    }
}