//
//  Notice.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import Foundation

/// 공지글 자세히 보기
struct PostResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: PostResult?
}

struct PostResult: Codable {
    let post: [Post]?
    let imageURLs: [String]?
}

struct Post: Codable, Identifiable {
    let id = UUID().uuidString
    let postId: Int?
    let postType: PostType?
    let postTitle: String?
    let postBody: String?
    let startDate: String?
    let endDate: String?
    let commentCount: Int?
    let submitState: String?
    let unreadCount: Int?
}

/// 고정된 공지글
struct FixedPost: Identifiable, Codable {
    let id = UUID().uuidString
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: FixedPostResult?
}

struct FixedPostResult: Identifiable, Codable {
    var id = UUID().uuidString
    var postId: Int?
    var title: String?
    var startDate: String?
    var endDate: String?
}

/// 최근 공지
struct RecentPostResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: RecentPostResult?
}

struct RecentPostResult: Codable {
    let recentPostList: [RecentPost]?
    let isNext: Bool?
    let totalPages: Int?
}

struct RecentPost: Codable, Identifiable {
    let id = UUID().uuidString
    let roomId: Int?
    let roomName: String?
    let postId: Int?
    let title: String?
    let createdAt: String?
}

/// 공지글 미리보기
struct PostLiteResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: PostLiteResult?
}

struct PostLiteResult: Codable {
    let roomName: String?
    let isRoomAdmin: Bool?
    let joinedRoomAt: String?
    let penaltyCount: Int?
    let maxPenalty: Int?
    let notCheckedPenalty: [NotCheckedPenalty]?
    let posts: [PostLite]?
    let cursorID: Int?
}

struct NotCheckedPenalty: Codable, Identifiable {
    let id = UUID().uuidString
    let postId: Int?
    let postTitle: String?
}

struct PostLite: Codable, Identifiable {
    let id = UUID().uuidString
    let postId: Int?
    let postType: PostType?
    let postTitle: String?
    let postBody: String?
    let postImage: String?
    let startDate: String?
    let endDate: String?
    let commentCount: Int?
    let submitState: SubmitStateType?
    let unreadCount: Int?
}




extension PostResponse {
    static var stub1: PostResponse = .init(
        isSuccess: true, code: 200, message: "Success!",
        result: .init(
            post: [
                
            ],
            imageURLs: [
                "url"
            ]
        )
    )
}

extension FixedPost {

    static var stub1: FixedPost =
        .init(isSuccess: true, code: 200, message: "성공",
              result: .init(id: "", postId: 1, title: "stub1 제목", startDate: "00.00.00", endDate: "99.99.99"
              )
        )
}

extension RecentPostResponse {
    static var recentpostResponseStub1: RecentPostResponse =
        .init(isSuccess: true, code: 200, message: "Success!", result: .recentPostResultStub1)
}

extension RecentPostResult {
    static var recentPostResultStub1: RecentPostResult =
        .init(recentPostList:
                          [
                              .recentPostStub1
                          ],
                      isNext: true,
                      totalPages: 3)
}

extension RecentPost {
    static var recentPostStub1: RecentPost =
        .init(roomId: 1, roomName: "room name", postId: 1, title: "title", createdAt: "24.01.01")
}

/// 공지글 미리보기
extension PostLiteResponse {
    static var stub1: PostLiteResponse =
        .init(isSuccess: true, code: 200, message: "Success!",
              result: .init(roomName: "roomName", isRoomAdmin: true, joinedRoomAt: "yy-MM-dd", penaltyCount: 99, maxPenalty: 99, notCheckedPenalty: [.notCheckedPenaltyStub1], posts: [.postStub01], cursorID: 1)
        )
}

/// 미확인 페널티 (팝업)
extension NotCheckedPenalty {
    static var notCheckedPenaltyStub1: NotCheckedPenalty = .init(postId: 1, postTitle: "title")
}

/// 공지글
extension PostLite {
    static var postStub01: PostLite =
        .init(postId: 200, postType: .mission, postTitle: "", postBody: "", postImage: "", startDate: "yy-MM-dd", endDate: "yy-MM-dd", commentCount: 1, submitState: .complete, unreadCount: 99)
}
