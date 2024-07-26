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
