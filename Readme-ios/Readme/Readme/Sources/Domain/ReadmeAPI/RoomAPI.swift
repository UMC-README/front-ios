//
//  RoomAPI.swift
//  Readme
//
//  Created by Subeen on 7/27/24.
//

import Foundation

/// Room - User(일반멤버)

public enum RoomAPI {
    
    case confirmPassword
    case notComplete(String)
    // TODO: 공지방 검색 추가하기
    case all(Int)
    case fixPost
    case deleteFixPost
    case post(Int)
    case postComment
    case getPostComment
    case patchPostComment(Int)
    case deletePostComment(Int)
//    case getPost(Int)
    case postAnswer(Int)
    case roomPenalty(Int)
    
    public var apiDesc: String {
        switch self {
        case .confirmPassword:
            return "/room/confirm-password"
            
        case .notComplete(let roomId):
            return "/room/\(roomId)/main?type=notComplete"
            
        case .all(let roomId):
            return "/room/\(roomId)/all"
            
        case .fixPost:
            return "/room/fixPost"
            
        case .deleteFixPost:
            return "/room/fixPost"
            
        case .post(let postId):
            return "/room/post/\(postId)"
            
        case .postComment:
            return "/room/post/comment"
            
        case .getPostComment:
            return "/room/post/comment"
            
        case .patchPostComment(let commentId):
            return "/room/post/\(commentId)"
            
        case .deletePostComment(let commentId):
            return "/room/post/\(commentId)"
            
//        case .getPost(let postId):
//            return "/room/\(postId)"
            
        case .postAnswer(let postId):
            return "/room/\(postId)"
            
        case .roomPenalty(let roomId):
            return "/room/\(roomId)/penalty"
            
        }
    }
}
