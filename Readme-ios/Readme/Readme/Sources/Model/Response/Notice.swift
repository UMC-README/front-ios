//
//  Notice.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import Foundation

/// 공지글 자세히 보기 (임시)
struct PostResponse: Identifiable, Codable {
    let id = UUID().uuidString
    let title: String?
    let content: String?
    let type: PostType?
    let startDate: String?
    let endDate: String?
    let commentCount: Int?
    let question: String?
    let quizAnswer: String?
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

/// 고정된 공지글
struct FixedPostResult: Identifiable, Codable {
    var id = UUID().uuidString
    var postId: Int?
    var title: String?
    var startDate: String?
    var endDate: String?
}

/// 공지글 미리보기
// MARK: - PostLiteResponse
struct PostLiteResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: PostLiteResult?
}

// MARK: - PostLiteResult
struct PostLiteResult: Codable {
    let postData: [PostDatum]?
    let cursorId: Int?
}

// MARK: - PostDatum
struct PostDatum: Codable, Identifiable {
    let id = UUID().uuidString
    let postId: Int?
    let postType: PostType?
    let postTitle: String?
    let postBody: String?
    let postImage: String?
    let startDate: String?
    let endDate: String?
    let commentCount: Int?
    let submitState: String?
}


extension PostResponse {
    static var stub1: PostResponse = .init(title: "title01", content: "공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다.", type: .mission, startDate: "99.99.99", endDate: "99.99.99", commentCount: 10, question: "공지글 퀴즈 예제입니다.", quizAnswer: "정답", unreadCount: 10)
}

extension FixedPost {

    static var stub1: FixedPost =
        .init(isSuccess: true, code: 200, message: "성공",
              result: .init(id: "", postId: 1, title: "stub1 제목", startDate: "00.00.00", endDate: "99.99.99"
              )
        )
}


extension PostLiteResponse {
    static var stub1: PostLiteResponse = .init(isSuccess: true, code: 200, message: "Success!", 
                                               result: .init(postData: [
                                                .init(postId: 1, postType: .quiz, postTitle: "title", postBody: "post body", postImage: "", startDate: "yyyymmmdd", endDate: "yyyymmmdd", commentCount: 23, submitState: "state")
                                               
                                               ], cursorId: 1))
}
