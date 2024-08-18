//
//  Auth.swift
//  Readme
//
//  Created by Subeen on 8/18/24.
//

import Foundation

/// 이메일 인증코드 생성
struct EmailResponse: Codable {
    let status: Int?
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: String?
}

/// 이메일 인증코드 확인
struct CodeResponse: Codable {
    let status: Int?
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: CodeResult?
}

struct CodeResult: Codable {
    let verified: Bool?
}


/// 회원가입 응답값
struct SignUpResponse: Codable {
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: SignUpResult?
}

struct SignUpResult: Codable {
    let userID: Int?
    let nickname: String?
    let accessToken: String?
}


extension EmailResponse {
    public static var emailResponseStub1: EmailResponse = .init(status: 200, isSuccess: true, code: 9999, message: "message", result: "result")
}

extension CodeResponse {
    public static var codeResponseStub1: CodeResponse = .init(status: 200, isSuccess: true, code: 200, message: "Success!", result: .init(verified: true))
}

extension SignUpResponse {
    public static var signUpResponseStub1: SignUpResponse = .init(isSuccess: true, code: 200, message: "Success!", result: .init(userID: 1, nickname: "nickname", accessToken: "token"))
}
