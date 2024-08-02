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
import KakaoSDKAuth
import KakaoSDKUser

enum AuthenticationError: Error {
    case userIDError  // client id가 없음
    case tokenError     // 토큰 없음
    case invalidated
}

protocol AuthenticationServiceType {
    func signUpWithEmail() async throws /// 이메일로 회원가입
    func signIn(email: String, password: String) async throws -> AuthResponse   /// 로그인
    func getKakaoCode() async throws -> String                  /// 카카오 코드 발급
    func signInKakao(code: String) async throws -> AuthResponse /// 카카오 로그인
    
}

class AuthenticationService: AuthenticationServiceType {
    
    private let jsonDecoder = JSONDecoder()
    
    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    
    let accessToken: String? = TokenManager.shared.accessToken
    
    
    // TODO: 이메일로 회원가입
    func signUpWithEmail() async throws {
        
    }

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
                    print("로그인 네트워크 오류 \(error.localizedDescription)")
                    
                }
                
            }
        }
    }
    
    func getKakaoCode() async throws -> String {
        if UserApi.isKakaoTalkLoginAvailable() {
            return try await withCheckedThrowingContinuation { continuation in
                UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let oauthToken = oauthToken {
                        let code = oauthToken.accessToken
                        print("⭐️ kakao code : \(code)")
                        continuation.resume(returning: code)
                    }
                }
            }
        } else {
            return try await withCheckedThrowingContinuation { continuation in
                UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                    if let error = error {
                        continuation.resume(throwing: error)
                    } else if let oauthToken = oauthToken {
                        let code = oauthToken.accessToken
                        print("⭐️ kakao code : \(code)")
                        continuation.resume(returning: code)
                    }
                }
            }
        }
    }
    
    /// 카카오 로그인
    func signInKakao(code: String) async throws -> AuthResponse {
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.kakaoSignIn(code: code)) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodedResponse = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                        continuation.resume(returning: decodedResponse)
                        print("kakao 로그인 response 디코딩 성공")
                    } catch {
                        continuation.resume(throwing: error)
                        print("kakao 로그인 response 디코딩 실패 \(error.localizedDescription)")
                    }
                case .failure(let error):
                    continuation.resume(throwing: error)
                    print("kakao 로그인 네트워크 오류 \(error.localizedDescription)")
                    
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
    
    func getKakaoCode() async throws -> String {
        return ""
    }
    
    func signInKakao(code: String) async throws -> AuthResponse {
        return .stub01
    }
    
}
