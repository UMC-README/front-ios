//
//  Notice.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import Foundation

struct Notice: Identifiable, Codable {
    var id = UUID().uuidString
    var title: String?
    var content: String?
    var type: NoticeType?
    var startDate: String?
    var endDate: String?
    var commentCount: Int?
    var question: String?
    var quizAnswer: String?
    var unreadCount: Int?
    
//    enum CodingKeys: CodingKey {
//    
//    }
    
}

extension Notice {
    static var stub1: Notice = .init(id: "notice01", title: "title01", content: "공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다. 공지글 내용 예제입니다.", type: .mission, startDate: "99.99.99", endDate: "99.99.99", commentCount: 10, question: "공지글 퀴즈 예제입니다.", quizAnswer: "정답", unreadCount: 10)
}
