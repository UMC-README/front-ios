//
//  Request.swift
//  Readme
//
//  Created by Subeen on 8/20/24.
//

import Foundation

/// 확인 요청 내역 공지글 목록
struct RequestRoomResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [RequestRoomResult]?
}

struct RequestRoomResult: Codable, Identifiable {
    let id = UUID().uuidString
    let postId: Int?
    let title: String?
    let content: String?
    let startDate: String?
    let endDate: String?
    let image: String?
    let pendingCount: Int?
}

/// 하나의 공지글에 대한 확인 요청 내역
struct RequestPostResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: [RequestPostResult]?
}

struct RequestPostResult: Codable {
    let submitId: Int?
    let profileImage: String?
    let images: [String]?
    let content: String?
    let submitState: SubmitStateType?
}

extension RequestRoomResponse {
    public static var requestRoomStub1: RequestRoomResponse = .init(isSuccess: true, code: 200, message: "Success!", result: [
        .init(postId: 1, title: "title", content: "content", startDate: "yy-MM-dd", endDate: "yy-MM-dd", image: "", pendingCount: 1)
    
    ])
}

extension RequestPostResponse {
    public static var requestPostStub1: RequestPostResponse = .init(isSuccess: true, code: 200, message: "Success!", result: [
        .init(submitId: 1, profileImage: "", images: [""], content: "", submitState: .complete)
    ])
}
