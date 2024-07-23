//
//  Room.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import Foundation

/// 공지방 Model
struct Room: Codable, Identifiable {
    var id = UUID().uuidString
    var adminID: String?            /// 관리자 ID
    var adminNickname: String?      /// 관리자 닉네임
    var roomName: String?           /// 공지방 이름
    var roomPassword: String?       /// 공지방 비밀번호
    var roomImage: String?          /// 공지방 사진
    var roomInviteUrl: String?      /// 초대 URL
    var maxPenalty: Int?            /// 최대 페널티 개수
    var state: stateType?           /// 존재 여부
    

    
    enum CodingKeys: String, CodingKey {
        case adminID = "admin_id"
        case adminNickname = "admin_nickname"
        case roomName = "room_name"
        case roomPassword = "room_password"
        case roomImage = "room_image"
        case roomInviteUrl = "room_invite_url"
        case maxPenalty = "max_penalty"
    }
    
}
