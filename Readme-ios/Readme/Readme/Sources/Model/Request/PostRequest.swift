//
//  PostRequest.swift
//  Readme
//
//  Created by Subeen on 8/8/24.
//

import Foundation

// MARK: - PostRequest
struct PostRequest: Codable {
    let body: PostRequestBody?
    let imgURLs: [String]?
}

// MARK: - Body
struct PostRequestBody: Codable {
    let roomID: Int?
    let type: String?
    let title: String?
    let content: String?
    let startDate: String?
    let endDate: String?
    let question: String?

    enum CodingKeys: String, CodingKey {
        case roomID = "room_id"
        case type = "type"
        case title = "title"
        case content = "content"
        case startDate = "start_date"
        case endDate = "end_date"
        case question = "question"
    }
}
