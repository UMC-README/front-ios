//
//  RoomRequest.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//
import Foundation

// MARK: - RoomRequest
struct RoomRequest: Codable {
    let adminID: Int
    let adminNickname, roomName, roomPassword, roomImage: String
    let inviteURL: String
    let maxPenalty: Int

    enum CodingKeys: String, CodingKey {
        case adminID = "admin_id"               // 관리자 아이디
        case adminNickname = "admin_nickname"   // 관리자 닉네임(단체 대표자 이름)
        case roomName = "room_name"             // 공지방 이름
        case roomPassword = "room_password"     // 공지방 비밀번호
        case roomImage = "room_image"           // 공지방 이미지
        case inviteURL = "invite_url"           // 공지방 초대 url
        case maxPenalty = "max_penalty"         // 공지방 최대 패널티 개수
    }
}

extension RoomRequest {
    static var stub01: RoomRequest = .init(adminID: 12, adminNickname: "예시 닉네임 숩", roomName: "수원 사는 사람", roomPassword: "1234", roomImage: "", inviteURL: "", maxPenalty: 10)
}
