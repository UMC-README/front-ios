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
//    case signup
}

@Observable
class AuthenticationViewModel: ObservableObject {
    enum Action {
//        case checkAuthenticationState
        case signin
    }
    
    var authentificationState: AuthenticatedState = .unauthenticated
    var isLoading = false
    
    var userId: String?
    var userEmail: String?
    var userPassword: String?
    
    var isSignUp: Bool = false
    
    var authRequest: AuthRequest?
    var signInQuestions: [SignUpQuestionType] = [.name, .nickname, .email, .password]
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension AuthenticationViewModel {
    
    func createAuthRequest(name: String, nickname: String, email: String, password: String) -> AuthRequest {
        return .init(name: name, nickname: nickname, email: email, password: password)
    }
    
    func signUpWithEmain() async {
        if let authRequest = authRequest {
            do {
//                try await container.services.userService.sig
            } catch {
                
            }
        }
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
