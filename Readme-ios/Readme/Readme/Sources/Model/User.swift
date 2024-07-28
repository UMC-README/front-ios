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

struct User: Identifiable, Codable {
    let id = UUID().uuidString
    let userId: Int
    let name: String?
    let email: String?
    let password: String?
    let profileImage: String?
}

extension User {
    static var stub1: User {
        .init(userId: 1, name: "정성찬", email: "jsc@gmail.com", password: "1234", profileImage: "")
    }

    static var stub2: User {
        .init(userId: 2, name: "유우시", email: "abc@gmail.com", password: "1234", profileImage: "")
    }

    static var stub3: User {
        .init(userId: 3, name: "김석진", email: "abc@gmail.com", password: "1234", profileImage: "")
    }
    
    static var stub4: User {
        .init(userId: 4, name: "리쿠", email: "abc@gmail.com", password: "1234", profileImage: "")
    }
}
