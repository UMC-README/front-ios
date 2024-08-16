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
    
    // TODO: 확인요청내역조회 /api/admin/submit/type=?
    //    case submitType
    
    // TODO: 대기중 요청 수락/거절
    // case postSubmitType(String)
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
            
            
        // TODO: 확인요청내역조회 /api/admin/submit/type=?
        //    case submitType
        
        // TODO: 대기중 요청 수락/거절
        // case postSubmitType(String)
            
        case .penalty:
            return "/admin/penalty"
        }
    }
}
