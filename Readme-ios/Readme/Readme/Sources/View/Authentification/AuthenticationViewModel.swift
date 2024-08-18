//
//  AuthentificationViewModel.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation
import SwiftData

enum AuthenticatedState {
    case unauthenticated
    case authenticated
    case completeSignup
}

@Observable
class AuthenticationViewModel: ObservableObject {
    enum Action {
//        case checkAuthenticationState
        case goToSigninMain
//        case signin
    }
    
    var authentificationState: AuthenticatedState = .unauthenticated
    var isLoading = false
    
    var userId: String?
    var userEmail: String?
    var userPassword: String?
    
    var isSignUp: Bool = false
    var signUpCurrentPage = 1
    
    var authRequest: AuthRequest?
    var signInQuestions: [SignUpQuestionType] = [.name, .nickname, .email, .password]
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension AuthenticationViewModel {
    
    func send(action: Action) {
        switch action {
        case .goToSigninMain:
            isSignUp = false
        }
    }
    
    func createCode(email: String) async -> Bool {

        do {
            let response = try await container.services.userService.createCode(email: email)
            return response.isSuccess!
        } catch {
            print("Auth VM - createCode() 실패")
            return false
        }
    }
    
    func confirmCode(email: String, code: String) async -> Bool {
        do {
            let response = try await container.services.userService.confirmCode(email: email, code: code)
            return (response.result?.verified)!
        } catch {
            print("Auth VM - confirmCode() 실패")
            return false
        }
    }
    
    func createAuthRequest(name: String, nickname: String, email: String, password: String) {
        self.authRequest = .init(name: name, nickname: nickname, email: email, password: password)
    }
    
    func signUpWithEmail() async -> Bool {
        if let authRequest = authRequest {
            do {
                let response = try await container.services.userService.signupWithEmail(authRequest: authRequest)
                if response.isSuccess! {
                    TokenManager.shared.accessToken = response.result?.accessToken
                    authentificationState = .completeSignup
                    print("회원가입 성공!")
                }
            } catch {
                print("Auth VM - signUpWithEmail() 실패")
            }
        }
        
        return false
    }
    
    func signinWithEmail() async {
        print("signinWithEmail(⭐️ 로그인을 시작합니다. \(userEmail), \(userPassword)")
        if let result =
            try? await container.services.authService.signIn(
                email: userEmail!, password: userPassword!
            ) {
            TokenManager.shared.accessToken = result.result?.accessToken
                print(" ⭐️ Access Token : \(TokenManager.shared.accessToken)")
                authentificationState = .authenticated
                print("- 로그인 성공")
            
        }
    }
    
    func signinWithKakao() async {
        
        guard let code: String = try? await container.services.authService.getKakaoCode() else {
            print("kakao code 생성 실패")
            return 
        }
        
        print("signinWithKakao(⭐️ 로그인을 시작합니다. \(code)")
        if let result =
            try? await container.services.authService.signInKakao(code: code)
             {
            TokenManager.shared.accessToken = result.result?.accessToken
                print(" ⭐️ Access Token : \(TokenManager.shared.accessToken)")
                authentificationState = .authenticated
                print("- 로그인 성공")
            
        }
    }
}
