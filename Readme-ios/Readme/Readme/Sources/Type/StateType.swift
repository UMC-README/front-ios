//
//  StateType.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import SwiftUI

/// 존재 여부 State
enum StateType: String, Codable {
    case exist = "EXIST"
    case deleted = "DELETED"
    
//    var description: String {
//        switch self {
//        case .deleted:
//            "삭제된 공지방"
//        case .exist:
//            ""
//        }
//    }
    
    /// 아이콘 배경 색상
    var backColor: SwiftUI.Color {
        switch self {
        case .exist:
            Color.primaryNormal
        case .deleted:
            Color.danger
        }
    }
}


