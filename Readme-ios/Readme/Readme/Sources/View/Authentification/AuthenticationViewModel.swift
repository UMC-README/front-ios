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
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension AuthenticationViewModel {
    
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
}
