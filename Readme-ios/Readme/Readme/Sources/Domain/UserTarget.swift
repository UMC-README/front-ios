//
//  UserAPI.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Moya

enum UserTarget {
    case getUser(accessToken: String)   // 내 프로필 조회
}

extension UserTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    var path: String {
        switch self {
        case .getUser:
            return UserAPI.user.apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getUser:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getUser(let accessToken):
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let token: String
        switch self {
        case .getUser(let accessToken):
            token = accessToken
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(accessToken)",

            ]
        }
    }
}
