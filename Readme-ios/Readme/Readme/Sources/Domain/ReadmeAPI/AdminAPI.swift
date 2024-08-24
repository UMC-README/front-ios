//
//  AdminAPI.swift
//  Readme
//
//  Created by Subeen on 7/27/24.
//

import Foundation

/// Room - Admin 운영진

public enum AdminAPI {
    
    case createRoom
    case patchRoom(String)
    case deleteRoom(String)
    case createPost
    case patchPost(String)
    case deletePost(String)
    case unconfirmedUser
    case search
    case profile(String)
    case invitations
    case deleteUser(String)
    
    case getRoomRequest(Int) /// 확인 요청 내역 공지글 목록 조회
    case getPostRequest(Int, Int) /// 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회
    case acceptOrRejectRequest(Int)  /// 대기중 요청 수락/거절
    
    case penalty
    
    public var apiDesc: String {
        switch self {
        case .createRoom:
            return "/admin/rooms"
            
        case .patchRoom(let roomId):
            return "/rooms/\(roomId)"
            
        case .deleteRoom(let roomId):
            return "/rooms/\(roomId)"
            
        case .createPost:
            return "/admin/post"
            
        case .patchPost(let roomId):
            return "/admin/post/\(roomId)"
        case .deletePost(let roomId):
            return "/admin/post/\(roomId)"
            
        case .unconfirmedUser:
            return "/admin/post"
            
        case .search:
            return "/admin/users"
            
        case .profile(let userId):
            return "/admin/profile/\(userId)"
            
        case .invitations:
            return "/admin/invitations"
            
        case .deleteUser(let userId):
            return "/admin/users/\(userId)"
            
        case .getRoomRequest(let roomId):
            return "/admin/posts/\(roomId)"
            
        case .getPostRequest(let roomId, let postId):
            return "/admin/submit/\(roomId)/\(postId)"
            
        case .acceptOrRejectRequest(let submitId):
            return "/admin/submit/\(submitId)"
            
        case .penalty:
            return "/admin/penalty"
        }
    }
}
