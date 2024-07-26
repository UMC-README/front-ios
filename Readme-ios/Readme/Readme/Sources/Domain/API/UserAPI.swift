//
//  UserAPI.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Moya

enum UserAPI {
    case profile(accessToken: String)   // 내 프로필 조회
}

extension UserAPI: BaseTargetType {
    var baseURL: URL {
        return URL(string: ReadmeAPI.baseURL)!
    }
    
    var path: String {
        switch self {
        case .profile:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .profile:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .profile(let accessToken):
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let token: String
        switch self {
        case .profile(let accessToken):
            token = accessToken
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(accessToken)",

            ]
        }
    }
}
