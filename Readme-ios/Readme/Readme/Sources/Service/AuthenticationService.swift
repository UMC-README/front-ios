//
//  AuthenticationService.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation
import Combine
import CombineMoya
import Moya
import SwiftUI

enum AuthenticationError: Error {
    case userIDError  // client id가 없음
    case tokenError     // 토큰 없음
    case invalidated
}

protocol AuthenticationServiceType {
    /// 이메일로 회원가입
    func signUpWithEmail() async throws 
    
    /// 로그인
    func signIn(email: String, password: String) async throws -> AuthResponse
}

class AuthenticationService: AuthenticationServiceType {
    
    private let jsonDecoder = JSONDecoder()
    
    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    
    let accessToken: String? = TokenManager.shared.accessToken
    
    
    // TODO: 이메일로 회원가입
    func signUpWithEmail() async throws {
        
    }
    
//    func signIn() async throws  -> Bool {
//        TokenManager.shared.accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJwcm92aWRlciI6IlJFQURNRSIsImlhdCI6MTcyMjQ0NTQwMCwiZXhwIjoxNzIyNDU2MjAwfQ.-znEQ_WY1yJK1GFmoznSeJTC6KP35w7KEuSDvE2i30E"
//        
//        return true
//    }

    /// 로그인
    func signIn(email: String, password: String) async throws -> AuthResponse {
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.signIn(email: email, password: password)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodedResponse = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                        continuation.resume(returning: decodedResponse)
                        print("로그인 response 디코딩 성공")
                    } catch {
                        continuation.resume(throwing: error)
                        print("로그인 response 디코딩 실패 \(error.localizedDescription)")
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                    print("s3 이미지 링크 생성 네트워크 오류 \(error.localizedDescription)")
                    
                }
                
            }
        }
    }
}

class StubAuthenticationService: AuthenticationServiceType {

    func signUpWithEmail() async throws {
        
    }
    
    func signIn(email: String, password: String) async throws -> AuthResponse {
        return .stub01
    }
    
}
