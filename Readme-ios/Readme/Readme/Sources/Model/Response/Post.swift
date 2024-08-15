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
    let id = UUID().uuidString
    let postType: PostType?
    let postTitle: String?
    let postContent: String?
    let imgURLs: String?
    let startDate: String?
    let endDate: String?
    let question: String?
}

/// 고정된 공지글
struct FixedPost: Identifiable, Codable {
    let id = UUID().uuidString
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: FixedPostResult?
    
    struct FixedPostResult: Identifiable, Codable {
        var id = UUID().uuidString
        var postId: Int?
        var title: String?
        var startDate: String?
        var endDate: String?
    }
}

/// 공지글 미리보기
struct PostLiteResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: PostLiteResult?
    
    struct PostLiteResult: Codable {
        let isRoomAdmin: Bool?
        let posts: [Post]?
        let cursorID: Int?

        enum CodingKeys: String, CodingKey {
            case isRoomAdmin = "isRoomAdmin"
            case posts = "posts"
            case cursorID = "cursorId"
        }
    }
}

// MARK: - Post
struct Post: Codable, Identifiable {
    let id = UUID().uuidString
    let postID: Int?
    let postType: PostType?
    let postTitle: String?
    let postBody: String?
    let postImage: [String]?
    let startDate: String?
    let endDate: String?
    let commentCount: Int?
    let submitState: SubmitStateType?
    let unreadCount: Int?

    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case postType = "postType"
        case postTitle = "postTitle"
        case postBody = "postBody"
        case postImage = "postImage"
        case startDate = "startDate"
        case endDate = "endDate"
        case commentCount = "commentCount"
        case submitState = "submitState"
        case unreadCount = "unreadCount"
    }
}


extension PostResponse {
    static var stub1: PostResponse = .init(isSuccess: true, code: 200, message: "Success", result: .init(postType: .mission, postTitle: "postTitpe", postContent: "postContent", imgURLs: "imgURLs", startDate: "start date", endDate: "end date", question: "question"))
}

extension FixedPost {

    static var stub1: FixedPost =
        .init(isSuccess: true, code: 200, message: "성공",
              result: .init(id: "", postId: 1, title: "stub1 제목", startDate: "00.00.00", endDate: "99.99.99"
              )
        )
}


extension PostLiteResponse {
    static var stub1: PostLiteResponse =
        .init(isSuccess: true, code: 200, message: "Success!",
              result: .init(isRoomAdmin: true, 
                            posts: [
                                .postStub01
                            ],
                            cursorID: 1
              )
        )
}

extension Post {
    static var postStub01: Post =
        .init(postID: 1, postType: .mission, postTitle: "stub title", postBody: "stub postBody", postImage: [], startDate: "2024.01.01", endDate: "2024.12.31", commentCount: 99, submitState: .complete, unreadCount: 1)
}
