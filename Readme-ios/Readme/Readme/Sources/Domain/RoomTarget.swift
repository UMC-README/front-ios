//
//  RoomTarget.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import Foundation
import Moya

enum RoomTarget {
    case getAllNotice(roomId: Int, accessToken: String)   // 내 프로필 조회
    case getPost(postId: Int, accessToken: String)          // 개별 공지글 상세 조회
    
    case getSubmitRequirement(postId: Int, accessToken: String)   /// 퀴즈/미션 제출 요구사항 조회
    case postSubmitRequirement(postId: Int, submitRequest: SubmitRequest, accessToken: String) /// 퀴즈/미션 제출 요구사항 제출
}

extension RoomTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    var path: String {
        switch self {
        case .getAllNotice(let roomId, _):
            return RoomAPI.all(roomId).apiDesc
            
        case .getPost(let postId, _):
            return RoomAPI.post(postId).apiDesc
            
        case .getSubmitRequirement(let postId, _):
            return RoomAPI.getSubmitRequirement(postId).apiDesc
            
        case .postSubmitRequirement(let postId, _, _):
            return RoomAPI.postSubmitRequirement(postId).apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getAllNotice,
                .getPost,
                .getSubmitRequirement:
            return .get
            
        case .postSubmitRequirement:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getAllNotice(_, _),
                .getPost(_, _),
            
                .getSubmitRequirement(_, _):
            // TODO: roomID 수정
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
            
        case .postSubmitRequirement(_, let submitRequest, _):
            return .requestJSONEncodable(submitRequest)
        }
    }
    
    var headers: [String : String]? {
        let token: String
        switch self {
        case .getAllNotice(_, let accessToken),
                .getPost(_, let accessToken),
                
                .getSubmitRequirement(_, let accessToken),
                .postSubmitRequirement(_, _, let accessToken):
            token = accessToken
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",

            ]
        }
    }
}
