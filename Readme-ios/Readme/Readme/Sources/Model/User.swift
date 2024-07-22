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
