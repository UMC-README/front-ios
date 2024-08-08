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
        let postData: [PostDatum]?
        let cursorId: Int?
    }
}

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
    static var stub1: PostLiteResponse = .init(isSuccess: true, code: 200, message: "Success!", 
                                               result: .init(postData: [
                                                .init(postId: 1, postType: .quiz, postTitle: "title", postBody: "post body", postImage: "", startDate: "yyyymmmdd", endDate: "yyyymmmdd", commentCount: 23, submitState: "state")
                                               
                                               ], cursorId: 1))
}
