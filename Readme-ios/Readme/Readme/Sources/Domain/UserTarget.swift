//
//  UserAPI.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Moya

enum UserTarget {
    case s3Upload(data: [Data?], accessToken: String)     /// s3에 이미지 업로드
    case createCode(email: String)                      /// 이메일 인증코드 생성
    case confirmCode(email: String, code: String)       /// 이메일 인증코드 확인
    case signUp(authRequest: AuthRequest)               /// 회원가입
    case signIn(email: String, password: String)        /// 로그인
    case kakaoSignIn(code: String)                      /// 카카오 로그인
    case getUser(accessToken: String)                   /// 내 프로필 조회
    case getAllProfile(accessToken: String)             /// 내 프로필 전체 조회
    case getFixedPost(accessToken: String)              /// 고정 공지 조회
    case getRecentPost(page: Int, pageSize: Int, accessToken: String) /// 최근 공지글 목록 조회 조회
    case getCreateRoom(page: Int, pageSize: Int, accessToken: String)   /// 내가 생성한 공지방 조회
    case getJoinRoom(page: Int, pageSize: Int, accessToken: String)     /// 내가 입장한 공지방 조회
}

extension UserTarget: BaseTargetType {
    var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    var path: String {
        switch self {
        case .s3Upload:
            return UserAPI.postS3.apiDesc
            
        case .createCode:
            return UserAPI.createCode.apiDesc
        
        case .confirmCode:
            return UserAPI.confirmCode.apiDesc
        
        case .signUp:
            return UserAPI.signup.apiDesc
            
        case .signIn:
            return UserAPI.signin.apiDesc
            
        case .kakaoSignIn:
            return UserAPI.kakaoSignin.apiDesc
            
        case .getUser:
            return UserAPI.user.apiDesc
        
        case .getAllProfile:
            return UserAPI.profile.apiDesc
            
        case .getFixedPost:
            return UserAPI.fixed.apiDesc
            
        case .getRecentPost:
            return UserAPI.recent.apiDesc
            
        case .getCreateRoom:
            return UserAPI.createRoom.apiDesc
            
        case .getJoinRoom:
            return UserAPI.joinRoom.apiDesc
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .s3Upload:
            return .post
            
        case .createCode,
                .confirmCode,
                .signUp,
                .signIn,
                .kakaoSignIn:
            return .post
            
        case .getUser,
                .getAllProfile,
                .getFixedPost,
                .getRecentPost,
                .getCreateRoom,
                .getJoinRoom:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .s3Upload(let data, _):
            
            var multipartFormData = [MultipartFormData]()
            for (index, data) in data.enumerated() {
                multipartFormData.append(MultipartFormData(provider: .data(data!), name: "file", fileName: "image\(index).jpeg", mimeType: "image/jpg"))
                
            }
        
            return .uploadMultipart(multipartFormData)
            
        case .createCode(let email):
            let parameters : [String : Any] = [
                "email" : email
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .confirmCode(let email, let code):
            let parameters : [String : Any] = [
                "email" : email,
                "code" : code
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            
        case .signUp(let authRequest):
            return .requestJSONEncodable(authRequest) // -> Request Body 구조체 만들어서 사용
            
        case .signIn(let email, let password):
            let parameters: [String : Any] = [
                "email" : email,
                "password" : password
            ]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default) // -> 구조체 사용 X
            
        case .kakaoSignIn(let code):
            let parameters: [String : Any] = [
                "code" : code,
                "platform": "ios"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString) // ?{q변수명}={값}&{변수명2}={값2}
        
        case .getUser(_), .getAllProfile(_), .getFixedPost(_):
            let parameters : [String : Any] = [:]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
                
        case .getRecentPost(let page, let pageSize, _),
                .getCreateRoom(let page, let pageSize, _),
                .getJoinRoom(page: let page, pageSize: let pageSize, _):
            let parameters: [String : Any] = [
                "page" : page,
                "pageSize" : pageSize,
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)

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
        
        case .getUser(let accessToken),
                .getAllProfile(let accessToken),
                .getFixedPost(let accessToken):
            token = accessToken
            return [
//                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)",

            ]
            
        case .createCode(_):
            return [
                "Content-Type": "application/json"
            ]
            
        case .confirmCode(_, _):
            return [
                "Content-Type": "application/json"
            ]
            
        case .signUp(_):
            return [
                "Content-Type": "application/json"
            ]
            
        case .signIn(_, _):
            return [
                "Content-Type": "application/json"
            ]
            
        case .kakaoSignIn(_):
            return [
                "Content-Type": "application/json"
            ]
        
        case .getRecentPost(_, _, let accessToken),
                .getCreateRoom(_, _, let accessToken),
                .getJoinRoom(_, _, let accessToken):
            token = accessToken
            
            return [
                "Content-Type": "application/json",
                "Authorization" : "Bearer \(token)"
            ]
        }
    }
}
