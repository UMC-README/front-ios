//
//  UserService.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Combine
import CombineMoya
import Moya
import SwiftUI

protocol UserServiceType {
    func uploadImage(data: Data?) async throws -> ImageURLResponse  /// s3 이미지 url 생성
    
    func getUser() async throws -> UserResponse     /// 내 프로필 조회
//    func getRecentNotice() async throws -> [NoticeResponse] /// 최근 공지글 조회
    
    
    func getFixedNotice(completion: @escaping (Result<FixedPost, ServiceError>) -> Void)  /// 고정된 공지 조회
    func getFixedNotice() async throws -> FixedPost       /// 고정된 공지 조회
    
    func getRecentPost() async throws -> RecentPostResponse
    
    
    func getCreateRoom() async throws -> RoomLiteResponse
    func getJoinRoom() async throws -> RoomLiteResponse
}

class UserService: UserServiceType {
    

    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    
    
    /// s3 이미지 url 생성
    func uploadImage(data: Data?) async throws -> ImageURLResponse {
        
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub01
        }
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.s3Upload(data: data, accessToken: accessToken), completion: { result in
                print("data \(data)")
                switch result {
                case .success(let response):
                    do {
                        let decodedResponse = try JSONDecoder().decode(ImageURLResponse.self, from: response.data)
                        continuation.resume(returning: decodedResponse)
                        //                        print("response \(decodedResponse)")
                        print("s3 이미지 링크 생성 성공")
                    } catch {
                        print("s3 이미지 링크 생성 실패 \(error.localizedDescription)")
                        continuation.resume(throwing: error)
                    }
                case .failure(let error):
                    print("s3 이미지 링크 생성 네트워크 오류 \(error.localizedDescription)")
                    continuation.resume(throwing: error)
                }
            })
        }
    }
    
    
    /// 내 프로필 조회
    func getUser() async throws -> UserResponse {
        
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub01
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getUser(accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(UserResponse.self, from: response.data)
//                        user = response
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("UserService - 내 프로필 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("UserService - 내 프로필 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
    
    /// 고정된 공지 조회
    func getFixedNotice(completion: @escaping (Result<FixedPost, ServiceError>) -> Void) {
        
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return
        }
        
        provider.request(.getFixedPost(accessToken: accessToken)) { result in
            switch result {
            case let .success(response):
                do {
                    let response = try self.jsonDecoder.decode(FixedPost.self, from: response.data)
                    completion(.success(response))
                } catch {
                    completion(.failure(ServiceError.error(error)))
                }
            case let .failure(error):
                completion(.failure(ServiceError.error(error)))
            }
        }
    }
    
    func getFixedNotice() async throws -> FixedPost {
        
        let accessToken: String? = TokenManager.shared.accessToken
        
        var notice: FixedPost = .stub1
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return notice
        }
        
        provider.request(.getFixedPost(accessToken: accessToken)) { result in
            switch result {
            case let .success(response):
                do {
                    let response = try self.jsonDecoder.decode(FixedPost.self, from: response.data)
                    notice = response
                } catch {
                    Log.network("UserService - getFixedNotice()", error.localizedDescription)
                }
            case let .failure(error):
                Log.network("UserService - getFixedNotice()", error.localizedDescription)
            }
        }
        
        return notice
    }
    
    /// 최근 공지 조회
    func getRecentPost() async throws -> RecentPostResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .recentpostResponseStub1
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getRecentPost(page: 1, pageSize: 6, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(RecentPostResponse.self, from: response.data)
                        print("UserService - 최근 공지글 조회 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("UserService - 최근 공지글 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("UserService - 최근 공지글 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
    
    /// 내가 생성한 공지방 조회
    func getCreateRoom() async throws -> RoomLiteResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub01
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getCreateRoom(page: 1, pageSize: 6, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(RoomLiteResponse.self, from: response.data)
                        print("UserService - 내가 생성한 공지방 생성 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("UserService - 내가 생성한 공지방 생성 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("UserService - 내가 생성한 공지방 생성 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
        
    /// 내가 입장한 공지방 조회
    func getJoinRoom() async throws -> RoomLiteResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub01
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getJoinRoom(page: 1, pageSize: 6, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(RoomLiteResponse.self, from: response.data)
                        print("UserService - 내가 입장한 공지방 생성 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("UserService - 내가 입장한 공지방 생성 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("UserService - 내가 입장한 공지방 생성 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
}

class StubUserService: UserServiceType {
    

    func getUser() async throws -> UserResponse {
        return UserResponse.stub01
    }
    
    func getFixedNotice(completion: @escaping (Result<FixedPost, ServiceError>) -> Void) {
        
    }
    
    func getFixedNotice() async throws -> FixedPost {
        return FixedPost.stub1
    }
    
    func getRecentNotice() async throws -> [PostResponse] {
        return []
    }
    
    func getRecentPost() async throws -> RecentPostResponse {
        return .recentpostResponseStub1
    }

    func uploadImage(data: Data?) async throws -> ImageURLResponse {
        return ImageURLResponse.stub01
    }
    
    func getCreateRoom() async throws -> RoomLiteResponse {
        return .stub01
    }
    
    func getJoinRoom() async throws -> RoomLiteResponse {
        return .stub01
    }
}
