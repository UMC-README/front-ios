//
//  SubmitModelDestination.swift
//  Readme
//
//  Created by Subeen on 8/17/24.
//

import Foundation

/// 퀴즈/미션 제출 후 화면 전환
enum SubmitModelDestination: Hashable, Identifiable {
    case compete
    case notComplete
    case pending
    
    var id: Int {
        hashValue
    }
}
