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
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension AuthenticationViewModel {
    
    func signinWithEmail() async {
        print("signinWithEmail()")
        if let result = try? await container.services.authService.signIn() {
            if result {
                authentificationState = .authenticated
                print("- 로그인 성공")
            } else {
                print("- 로그인 실패")
            }
        }
    }
}
