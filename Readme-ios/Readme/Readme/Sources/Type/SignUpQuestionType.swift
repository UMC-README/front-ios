//
//  SignUpQuestionType.swift
//  Readme
//
//  Created by Subeen on 8/17/24.
//

import Foundation

enum SignUpQuestionType: String, Codable, CaseIterable {
    case name       /// 이름
    case nickname   /// 닉네임
    case email      /// 이메일
    case password   /// 비밀번호
    
    var description: String {
        switch self {
        case .name:
            "이름"
        case .nickname:
            "닉네임"
        case .email:
            "이메일"
        case .password:
            "비밀번호"
        }
    }
    
    var question: [String] {
        switch self {
        case .name:
            ["이름을 입력해주세요."]
        case .nickname:
            ["닉네임을 입력해주세요."]
        case .email:
            [
                "이메일을 입력해주세요.",
                "인증코드를 입력해주세요."
            ]
        case .password:
            ["비밀번호를 입력해주세요."]
        }
    }
    
    var page: Int {
        switch self {
        case .name:
            1
        case .nickname:
            2
        case .email:
            3
        case .password:
            4
        }
    }
}
