//
//  Notice.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import Foundation

struct NoticeResponse: Identifiable, Codable {
    let id = UUID().uuidString
    let title: String?
    let content: String?
    let type: NoticeType?
    let startDate: String?
    let endDate: String?
    let commentCount: Int?
    let question: String?
    let quizAnswer: String?
    let unreadCount: Int?
    
//    enum CodingKeys: CodingKey {
//    
//    }
    
}

struct FixedNotice: Identifiable, Codable {
    var id = UUID().uuidString
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: FixedNoticeResult?
}

struct FixedNoticeResult: Identifiable, Codable {
    var id = UUID().uuidString
    var postId: Int?
    var title: String?
    var startDate: String?
    var endDate: String?
}

extension NoticeResponse {
    static var stub1: NoticeResponse = .init(title: "title01", content: "공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다.", type: .mission, startDate: "99.99.99", endDate: "99.99.99", commentCount: 10, question: "공지글 퀴즈 예제입니다.", quizAnswer: "정답", unreadCount: 10)
}

extension FixedNotice {

    static var stub1: FixedNotice =
        .init(id: "", isSuccess: true, code: 200, message: "성공",
              result: .init(id: "", postId: 1, title: "stub1 제목", startDate: "00.00.00", endDate: "99.99.99"
              )
        )
}
