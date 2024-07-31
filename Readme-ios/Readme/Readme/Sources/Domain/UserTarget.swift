//
//  UserAPI.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Moya

enum UserTarget {
    case s3Upload(data: Data?, accessToken: String)
    case getUser(accessToken: String)   // 내 프로필 조회
    case getFixedNotice(accessToken: String)    // 고정 공지 조회
}

extension UserTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    var path: String {
        switch self {
        case .s3Upload:
            return UserAPI.imageUpload.apiDesc
            
        case .getUser:
            return UserAPI.user.apiDesc
            
        case .getFixedNotice:
            return UserAPI.fixed.apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .s3Upload:
            return .post
            
        case .getUser, .getFixedNotice:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .s3Upload(let data, _):
            let imageData = MultipartFormData(provider: .data(data!), name: "file", fileName: "image.jpeg", mimeType: "image/jpg")
            let multipartData = [imageData]

            return .uploadMultipart(multipartData)
            
        case .getUser(let accessToken), .getFixedNotice(let accessToken):
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        let token: String
        switch self {
        case .s3Upload(_, let accessToken):
            token = accessToken
            return [
                "Content-Type": "multipart/form-data",
                "Authorization": "Bearer \(token)",
            ]
        
        case .getUser(let accessToken), .getFixedNotice(let accessToken):
            token = accessToken
            return [
//                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",

            ]
        }
    }
}
