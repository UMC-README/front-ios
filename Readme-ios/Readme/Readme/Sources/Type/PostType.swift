//
//  NoticeType.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

/// 공지글 종류
enum PostType: String, Codable {
    case mission = "미션"
    case quiz = "퀴즈"
    
    var description: String {
        switch self {
        case .mission:
            "미션"
        case .quiz:
            "퀴즈"
        }
    }
    
    /// 아이콘 폰트 색상
    var foreColor: SwiftUI.Color {
        switch self {
        case .mission:
            Color.basicWhite
        case .quiz:
            Color.primaryNormal
        }
    }
    
    /// 아이콘 배경 색상
    var backColor: SwiftUI.Color {
        switch self {
        case .mission:
            Color.primaryNormal
        case .quiz:
            Color.basicWhite
        }
    }
}
