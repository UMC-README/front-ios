//
//  Submit.swift
//  Readme
//
//  Created by Subeen on 8/16/24.
//

import Foundation

/// 퀴즈/미션 제출 요구사항 조회
struct SubmitResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: SubmitResult?
    
    struct SubmitResult: Codable {
        let id: Int?
        let type: PostType?
        let question: String?
        
    }
}

/// 퀴즈/미션 제출 후 응답
struct SubmitAfterResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: SubmitAfterResult?

    struct SubmitAfterResult: Codable {
        let submitId: Int?
        let submitState: SubmitStateType?
    }

}




extension SubmitResponse {
    public static var submitResponseStub01: SubmitResponse = .init(
        isSuccess: true, code: 200, message: "Success!",
        result: .init(id: 1, type: .quiz, question: "question")
    )
}

extension SubmitAfterResponse {
    public static var submitAfterResponseStub01: SubmitAfterResponse = .init(isSuccess: true, code: 200, message: "Success!", result: .init(submitId: 1, submitState: .complete))
}
