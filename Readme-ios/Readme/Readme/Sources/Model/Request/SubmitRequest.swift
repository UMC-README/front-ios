//
//  SubmitRequest.swift
//  Readme
//
//  Created by Subeen on 8/16/24.
//

import Foundation

/// 미션 인증사진 제출
struct SubmitRequest: Codable {
    let content: String?
    let imageURLs: [String]?
}

