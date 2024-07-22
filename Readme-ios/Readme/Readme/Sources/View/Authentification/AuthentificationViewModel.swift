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
class AuthentificationViewModel: ObservableObject {
    enum Action {
        case checkAuthenticationState
    }
    
    var authentificationState: AuthenticatedState = .unauthenticated
    var isLoading = false
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
}

extension AuthentificationViewModel {
    func send(action: Action) {
        switch action {
            
        case .checkAuthenticationState:
            break
        }
    }
}
