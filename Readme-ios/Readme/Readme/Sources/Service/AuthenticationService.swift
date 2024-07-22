//
//  AuthenticationService.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation

enum AuthenticationError: Error {
    case userIDError  // client id가 없음
    case tokenError     // 토큰 없음
    case invalidated
}

protocol AuthenticationServiceType {
    /// 이메일로 회원가입
    func signUpWithEmail() async throws 
    
    /// 로그인
    func signIn()
}

class AuthenticationService: AuthenticationServiceType {
    
    func signUpWithEmail() {
        
    }
    
    func signIn() {
        
    }
}

class StubAuthenticationService: AuthenticationServiceType {
    func signUpWithEmail() {
        
    }
    
    func signIn() {
        
    }
}
