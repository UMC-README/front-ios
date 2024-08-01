//
//  AuthRequest.swift
//  Readme
//
//  Created by Subeen on 7/31/24.
//

struct AuthRequest: Codable {
    let name: String
    let nickname: String
    let email: String
    let password: String
}

extension AuthRequest {
    static let stub01: AuthRequest = .init(name: "한수빈", nickname: "숩", email: "hsb@gmail.com", password: "12345678")
}
