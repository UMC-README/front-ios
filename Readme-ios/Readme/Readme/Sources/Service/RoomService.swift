//
//  RoomService.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import Foundation
import Combine
import CombineMoya
import Moya
import SwiftUI


protocol RoomServiceType {
    func getAllNotice(roomId: Int) async throws -> PostLiteResponse
    func getPost(postId: Int) async throws -> PostResponse
    
    func getSubmitRequirement(postId: Int) async throws -> SubmitResponse   /// 퀴즈/미션 제출 요구사항 조회
    func postSubmitRequirement(postId: Int, submitRequest: SubmitRequest) async throws -> SubmitAfterResponse            /// 퀴즈/미션 제출 요구사항 제출
}

class RoomService: RoomServiceType {
    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<RoomTarget>(plugins: [MoyaLoggingPlugin()])
    
    let accessToken: String? = TokenManager.shared.accessToken
    
    /// 공지방 전체 공지글 조회
    func getAllNotice(roomId: Int) async throws -> PostLiteResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub1
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getAllNotice(roomId: roomId, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(PostLiteResponse.self, from: response.data)
                        print("RoomService - room \(roomId) 방 전체 공지글 조회 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("RoomService - room \(roomId) 방 전체 공지글 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("RoomService - room \(roomId) 방 전체 공지글 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            })
        }
    }
    
    /// 개별 공지글 상세 조회
    func getPost(postId: Int) async throws -> PostResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub1
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getPost(postId: postId, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(PostResponse.self, from: response.data)
                        print("RoomService - room \(postId)번 개별 공지글 상세 조회 성공")
//                        print(response)
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("RoomService - room \(postId)번 개별 공지글 상세 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("RoomService - room \(postId)번 개별 공지글 상세 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            })
        }
    }
    
    /// 퀴즈/미션 제출 요구사항 조회
    func getSubmitRequirement(postId: Int) async throws -> SubmitResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .submitResponseStub01
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getSubmitRequirement(postId: postId, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(SubmitResponse.self, from: response.data)
                        print("RoomService - room \(postId)번 공지글 퀴즈/미션 제출 요구사항 조회 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("RoomService - room \(postId)번 공지글 퀴즈/미션 제출 요구사항 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("RoomService - room \(postId)번 공지글 퀴즈/미션 제출 요구사항 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            })
        }
    }
    
    /// 퀴즈/미션 제출 요구사항 제출
    func postSubmitRequirement(postId: Int, submitRequest: SubmitRequest) async throws -> SubmitAfterResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .submitAfterResponseStub01
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.postSubmitRequirement(postId: postId, submitRequest: submitRequest, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(SubmitAfterResponse.self , from: response.data)
                        print("RoomService - room \(postId)번 공지글 퀴즈/미션 제출 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("RoomService - room \(postId)번 공지글 퀴즈/미션 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("RoomService - room \(postId)번 공지글 퀴즈/미션 제출 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
            })
        }
    }
}
    
    
class StubRoomService: RoomServiceType {
    func getAllNotice(roomId: Int) async throws -> PostLiteResponse {
        return .stub1
    }
    
    func getPost(postId: Int) async throws -> PostResponse {
        return .stub1
    }
    
    /// 퀴즈/미션 제출 요구사항 조회
    func getSubmitRequirement(postId: Int) async throws -> SubmitResponse {
        return .submitResponseStub01
    }
    
    /// 퀴즈/미션 제출 요구사항 제출
    func postSubmitRequirement(postId: Int, submitRequest: SubmitRequest) async throws -> SubmitAfterResponse {
        return .submitAfterResponseStub01
    }
}
