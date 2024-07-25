//
//  SubmitStateType.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import Foundation

/// 제출 상태 State
enum SubmitStateType: String, Codable {
    case complete = "승인"
    case pending = "검토 중"
    case reject = "거절"
    case notComplete = "미제출"
    
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
}