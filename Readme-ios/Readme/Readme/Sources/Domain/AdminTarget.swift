//
//  AdminTarget.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//

import Foundation
import Moya

enum AdminTarget {
    case createRoom(roomRequest: RoomRequest, accessToken: String)  /// 운영진 공지방 생성
}

extension AdminTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    var path: String {
        switch self {
        case .createRoom:
            return AdminAPI.createRoom.apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createRoom:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createRoom(let roomRequest, _):
//            let parameters : [String : Any] = [:]
            return .requestJSONEncodable(roomRequest)
        }
    }
    
    var headers: [String : String]? {
        let token: String
        switch self {
        case .createRoom(_, let accessToken):
            token = accessToken
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",

            ]
        }
    }
}
