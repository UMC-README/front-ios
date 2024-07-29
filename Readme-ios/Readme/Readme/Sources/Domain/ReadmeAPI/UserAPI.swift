//
//  ReadmeAPIUser.swift
//  Readme
//
//  Created by Subeen on 7/27/24.
//

import Foundation

/// User(공통)

public enum UserAPI {
    
    case imageUpload            /// S3 업로드
    case createCode             /// 이메일 인증코드 생성
    case confirmCode            /// 이메일 인증코드 확인
    case signup                 /// 회원가입
    case signin                 /// 로그인
    case user                   /// 내 프로필 조회
    case fixed                  /// 고정된 공지글 조회
    case recent                 /// 최근 공지글 목록 조회
    case createRoom             /// 내가 개설한 공지방 조회
    case joinRoom               /// 내가 입장한 공지방 조회
    case profile                /// 내 프로필 전체 조회
    case patchProfile           /// 내 기본 프로필 수정
    case patchProfileRoom(String)  /// 공지방별 프로필 수정
    case profileNickname(String)   /// 공지방별 닉네임 중복 확인
    case password               /// 내 비밀번호 확인
    case fetchPassword          /// 내 비밀번호 수정
    case rooms                  /// 본인이 소속된 공지방 조회
    case roomsMissions(String)     /// 공지방마다 제출한 미션 내역 조회
    case roomsPenalty           /// 각 공지방마다 페널티 조회
    
    
    public var apiDesc: String {
        switch self {
        case .imageUpload:  /// S3 업로드
            return "/user/s3/upload"
            
        case .createCode:   /// 이메일 인증코드 생성
            return "/user/s3/upload"
            
        case .confirmCode:  /// 이메일 인증코드 확인
            return "/user/confirm-code"
            
        case .signup:       /// 회원가입
            return "/user/signup"
            
        case .signin:       /// 로그인
            return "/user/signin"
            
        case .user:         /// 내 프로필 조회
            return "/user"
            
        case .fixed:        /// 고정된 공지글 조회
            return "/user/fixed"
            
        case .recent:       /// 최근 공지글 목록 조회
            return "/user/recent"
            
        case .createRoom:   /// 내가 개설한 공지방 조회
            return "/user/create-room"
 
        case .joinRoom:     /// 내가 입장한 공지방 조회
            return "/user/join-room"
            
        case .profile:       /// 내 프로필 전체 조회
            return "/user/profile"
            
        case .patchProfile: /// 내 기본 프로필 수정
            return "/user/profile"
            
        case .patchProfileRoom(let roomId): /// 공지방별 프로필 수정
            return "/user/profile/\(roomId)"
            
        case .profileNickname(let roomId):  /// 공지방별 닉네임 중복 확인
            return "/user/profile/\(roomId)/nickname"
            
        case .password:     /// 내 비밀번호 확인
            return "user/password"
            
        case .fetchPassword:    /// 내 비밀번호 수정
            return "user/password"
            
        case .rooms:        /// 본인이 소속된 공지방 조회
            return "/user/rooms"
            
        case .roomsMissions(let roomId):    /// 공지방마다 제출한 미션 내역 조회
            return "/user/rooms/\(roomId)/missions"
            
        case .roomsPenalty: /// 각 공지방마다 페널티 조회
            return "/user/rooms/penalty"
        }
    }
}
