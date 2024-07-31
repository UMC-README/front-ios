//
//  Room.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import Foundation

/// 공지방 Model
struct RoomResponse: Codable, Identifiable {
    let id = UUID().uuidString
    let adminID: String?            /// 관리자 ID
    let adminNickname: String?      /// 관리자 닉네임
    let roomName: String?           /// 공지방 이름
    let roomPassword: String?       /// 공지방 비밀번호
    let roomImage: String?          /// 공지방 사진
    let roomInviteUrl: String?      /// 초대 URL
    let maxPenalty: Int?            /// 최대 페널티 개수
    let state: StateType?           /// 존재 여부
    

    
    enum CodingKeys: String, CodingKey {
        case adminID = "admin_id"
        case adminNickname = "admin_nickname"
        case roomName = "room_name"
        case roomPassword = "room_password"
        case roomImage = "room_image"
        case roomInviteUrl = "room_invite_url"
        case maxPenalty = "max_penalty"
        case state = "state"
    }
    
}

extension RoomResponse {
    static var stub1: RoomResponse {
        .init(adminID: "admin01", adminNickname: "admin01", roomName: "roomName01", roomPassword: "roompassword", roomImage: "", roomInviteUrl: "", maxPenalty: 10, state: .exist)
    }
    
    static var stub2: RoomResponse {
        .init(adminID: "admin01", adminNickname: "admin01", roomName: "roomName01", roomPassword: "roompassword", roomImage: "", roomInviteUrl: "", maxPenalty: 10, state: .exist)
    }
    
    static var stub3: RoomResponse {
        .init(adminID: "admin01", adminNickname: "admin01", roomName: "roomName01", roomPassword: "roompassword", roomImage: "", roomInviteUrl: "", maxPenalty: 10, state: .exist)
    }
    
    static var stub4: RoomResponse {
        .init(adminID: "admin01", adminNickname: "admin01", roomName: "roomName01", roomPassword: "roompassword", roomImage: "", roomInviteUrl: "", maxPenalty: 10, state: .exist)
    }
    
    static var stub5: RoomResponse {
        .init(adminID: "admin01", adminNickname: "admin01", roomName: "roomName01", roomPassword: "roompassword", roomImage: "", roomInviteUrl: "", maxPenalty: 10, state: .exist)
    }
    
    static var stub6: RoomResponse {
        .init(adminID: "admin01", adminNickname: "admin01", roomName: "roomName01", roomPassword: "roompassword", roomImage: "", roomInviteUrl: "", maxPenalty: 10, state: .exist)
    }
    
}
