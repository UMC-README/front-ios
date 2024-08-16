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
    
    case getSubmitRequirement(Int)  /// 공지글 퀴즈/미션 제출 요구사항 조회
    case postSubmitRequirement(Int) /// 공지글 퀴즈/미션 제출 요구사항 제출
    
//    case roomPenalty(Int)
    
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
            
        case .getSubmitRequirement(let postId):
            return "/room/post/\(postId)/submit"
            
        case .postSubmitRequirement(let postId):
            return "/room/post/\(postId)/submit"
        }
    }
}
