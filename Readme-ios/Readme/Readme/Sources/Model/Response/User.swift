//
//  User.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation

///
///| user_id | 유저 아이디 | PK |
//| --- | --- | --- |
//| name | 이름 |  |
//| nickname | 닉네임 |  |
//| email | 이메일 |  |
//| password | 비밀번호 |  |
//| profileImage | 프로필 이미지 |  |

import Foundation

// MARK: - User
struct UserResponse: Codable, Identifiable {
    var id = UUID().uuidString
    let status: Int?
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: UserResult?
}

// MARK: - Result
struct UserResult: Codable, Identifiable {
    var id = UUID().uuidString
    let userID: Int?
    let name, nickname, email, profileImage: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case name, nickname, email, profileImage
    }
}


extension UserResponse {
    static var stub01: UserResponse {
        .init(status: 1, isSuccess: true, code: 200, message: "success!", result:
                .init(userID: 1, name: "정성찬", nickname: "정성찬", email: "jsc@gmail.com", profileImage: "")
        )
    }
    static var stub02: UserResponse {
        .init(status: 1, isSuccess: true, code: 200, message: "success!", result:
                .init(userID: 2, name: "유우시", nickname: "유우시", email: "jsc@gmail.com", profileImage: "")
        )
    }
    static var stub03: UserResponse {
        .init(status: 1, isSuccess: true, code: 200, message: "success!", result:
                .init(userID: 3, name: "김석진", nickname: "김석진", email: "jsc@gmail.com", profileImage: "")
        )
    }
    static var stub04: UserResponse {
        .init(status: 1, isSuccess: true, code: 200, message: "success!", result:
                .init(userID: 4, name: "한수빈", nickname: "한수빈", email: "jsc@gmail.com", profileImage: "")
        )
    }
    static var stub05: UserResponse {
        .init(status: 1, isSuccess: true, code: 200, message: "success!", result:
                .init(userID: 5, name: "강해린", nickname: "강해린", email: "jsc@gmail.com", profileImage: "")
        )
    }

}
