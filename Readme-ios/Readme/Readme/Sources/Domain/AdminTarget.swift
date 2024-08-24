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
    case createPost(postRequest: PostRequest, accessToken: String)  /// 운영진 공지글 생성
    
    case getRoomRequest(roomId: Int, accessToken: String) /// 확인 요청 내역 공지글 목록 조회
    case getPostRequest(roomId: Int, postId: Int, accessToken: String)   /// 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회
    case acceptOrRejectRequest(submitId: Int, accessToken: String)       /// 대기중 요청 수락/거절
}

extension AdminTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    var path: String {
        switch self {
        case .createRoom:
            return AdminAPI.createRoom.apiDesc
            
        case .createPost:
            return AdminAPI.createPost.apiDesc
            
        case .getRoomRequest(let roomId, _):
            return AdminAPI.getRoomRequest(roomId).apiDesc
        
        case .getPostRequest(let roomId, let postId, _):
            return AdminAPI.getPostRequest(roomId, postId).apiDesc
            
        case .acceptOrRejectRequest(let submitId, _):
            return AdminAPI.acceptOrRejectRequest(submitId).apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .createRoom,
            .createPost:
            return .post
        
        case .getRoomRequest,
                .getPostRequest:
            return .get
            
        case .acceptOrRejectRequest:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .createRoom(let roomRequest, _):
            return .requestJSONEncodable(roomRequest)
            
        case .createPost(let postRequest, _):
            return .requestJSONEncodable(postRequest)
            
        case .getRoomRequest(_, _):
            return .requestPlain
            
        case .getPostRequest(_, _, _):
            return .requestPlain
        
        case .acceptOrRejectRequest(_, _):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        let token: String
        switch self {
        case .createRoom(_, let accessToken),
                .createPost(_, let accessToken),
            
                .getRoomRequest(_, let accessToken),
                .getPostRequest(_, _, let accessToken),
                .acceptOrRejectRequest(_, let accessToken)
            :
            token = accessToken
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",
            ]
        }
    }
}
