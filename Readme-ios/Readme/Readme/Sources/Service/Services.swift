//
//  Services.swift
//  Readme
//
//  Created by Subeen on 7/21/24.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
}

class Services: ServiceType {
    var authService: AuthenticationServiceType
    
    init() {
        self.authService = AuthenticationService()
    }
}

// 프리뷰용 서비스
class StubServices: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
}
