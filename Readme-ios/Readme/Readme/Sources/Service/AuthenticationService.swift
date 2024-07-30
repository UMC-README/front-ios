//
//  AuthenticationService.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI
import Combine

enum AuthenticationError: Error {
    case userIDError  // client id가 없음
    case tokenError     // 토큰 없음
    case invalidated
}

protocol AuthenticationServiceType {
    /// 이메일로 회원가입
    func signUpWithEmail() async throws 
    
    /// 로그인
    func signIn() async throws -> Bool
}

class AuthenticationService: AuthenticationServiceType {
    
    // TODO: 이메일로 회원가입
    func signUpWithEmail() async throws {
        
    }
    
    // TODO: 로그인
    func signIn() async throws  -> Bool {
        TokenManager.shared.accessToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJwcm92aWRlciI6IlJFQURNRSIsImlhdCI6MTcyMjM0MDk1NCwiZXhwIjoxNzIyMzUxNzU0fQ.ldJ4nNKKAvM_4oOQns0SLC0LHjC_bcuthf3hCL6HLmI"
        return true
    }
}

class StubAuthenticationService: AuthenticationServiceType {
    func signUpWithEmail() async throws {
        
    }
    
    func signIn() async throws  -> Bool{
        return true
    }
}
