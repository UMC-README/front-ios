////
////  AuthService.swift
////  Readme
////
////  Created by Subeen on 7/31/24.
////
//
//import Foundation
//import Combine
//import CombineMoya
//import Moya
//import SwiftUI
//
//protocol AuthServiceType {
////    func createCode(email: String) async throws                     /// 이메일 인증코드 생성
////    func confirmCode(email: String, code: String) async throws      /// 이메일 인증코드 확인
////    func signUp(authRequest: AuthRequest)                           /// 회원가입
//    func signIn(email: String, password: String) async throws -> AuthResponse         /// 로그인
//}
////
//class AuthService: AuthServiceType {
//    
//    private let jsonDecoder = JSONDecoder()
//    
//    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
//    
//    let accessToken: String? = TokenManager.shared.accessToken
//    
//    
//}
