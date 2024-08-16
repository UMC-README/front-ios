//
//  RoomRequest.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//
import Foundation

// MARK: - RoomRequest

struct RoomRequest: Codable {
    let adminId: Int
    let adminNickname: String
    let roomName: String
    let roomPassword: String
    let roomImage: String
//    let roomInviteUrl: String
    let maxPenalty: Int
    
    enum CodingKeys: String, CodingKey {
        case adminId = "admin_id"               // 관리자 아이디
        case adminNickname = "admin_nickname"   // 관리자 닉네임(단체 대표자 이름)
        case roomName = "room_name"             // 공지방 이름
        case roomPassword = "room_password"     // 공지방 비밀번호
        case roomImage = "room_image"           // 공지방 이미지
//        case roomInviteUrl = "room_invite_url"  // 공지방 초대 url
        case maxPenalty = "max_penalty"         // 공지방 최대 패널티 개수
    }
}

extension RoomRequest {
//    static var stub01: RoomRequest = .init(adminId: 12, adminNickname: "숩", roomName: "공지방 예시이름", roomPassword: "1234", roomImage: "image.jpg", roomInviteUrl: "test.com", maxPenalty: 10)
    static var stub01: RoomRequest = .init(adminId: 0, adminNickname: "숩", roomName: "공지방 예시이름", roomPassword: "1234", roomImage: "image.jpg", maxPenalty: 10)
}
