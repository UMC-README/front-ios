//
//  SubmitStateType.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import SwiftUI

/// 제출 상태 State
enum SubmitStateType: String, Codable {
    case complete = "COMPLETE"
    case pending = "PENDING"
    case reject = "REJECT"
    case notComplete = "NOT_COMPLETE"
    
    var description: String {
        switch self {
        case .complete:
            "승인"
        case .pending:
            "검토 중"
        case .reject:
            "거절"
        case .notComplete:
            "미제출"
        }
    }
    
    /// 아이콘 폰트 색상
    var foreColor: SwiftUI.Color {
        switch self {
        case .complete:
            Color.success
        case .pending:
            Color.txtDefault
        case .reject:
            Color.danger
        case .notComplete:
            Color.txtCaption
        }
    }
    
    /// 아이콘 배경 색상
    var backColor: SwiftUI.Color {
        switch self {
        case .complete:
            Color.successLight
        case .pending:
            Color.gray2
        case .reject:
            Color.dangerLight
        case .notComplete:
            Color.gray2
        }
    }
}
