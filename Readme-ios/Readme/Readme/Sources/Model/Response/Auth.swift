//
//  AuthResponse.swift
//  Readme
//
//  Created by Subeen on 7/31/24.
//

import Foundation

// MARK: - AuthResponse
struct AuthResponse: Codable {
    let id = UUID().uuidString
    let status: Int?
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: AuthResult?
}

// MARK: - Result
struct AuthResult: Codable {
    let userId: Int?
    let accessToken: String?
}

extension AuthResponse {
    static let stub01: AuthResponse = .init(status: 1, isSuccess: true, code: 200, message: "Success!", result: .init(userId: 12, accessToken: ""))
}
