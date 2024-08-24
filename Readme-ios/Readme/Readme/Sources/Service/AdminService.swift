//
//  AdminService.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//

import Foundation
import Combine
import CombineMoya
import Moya
import SwiftUI

protocol AdminServiceType {
    func createRoom(roomRequest: RoomRequest) async throws -> CompleteRoomResponse   /// 운영진 공지방 생성
    func createPost(postRequest: PostRequest) -> Bool   /// 운영진 공지글 생성
    
    func getRoomRequest(roomId: Int) async throws -> RequestRoomResponse /// 확인 요청 내역 공지글 목록 조회
    func getPostRequest(roomId: Int, postId: Int) async throws -> RequestPostResponse   /// 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회
    func acceptOrRejectRequest(submitId: Int) async throws       /// 대기중 요청 수락/거절
}

class AdminService: AdminServiceType {
    private let jsonDecoder = JSONDecoder()
    
    let provider = MoyaProvider<AdminTarget>(plugins: [MoyaLoggingPlugin()])
    
    /// 공지방 생성
    func createRoom(roomRequest: RoomRequest) async throws -> CompleteRoomResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .comRoomResponseStub1
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.createRoom(roomRequest: roomRequest, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(CompleteRoomResponse.self, from: response.data)
                        print("room response \(response)")
                        print("AdminService - 공지방 생성 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("AdminService - 공지방 생성 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("AdminService - 공지방 생성 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
    
    
    /// 공지글 생성
    func createPost(postRequest: PostRequest) -> Bool {
        var createResult = false
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return createResult
        }
        
        provider.request(.createPost(postRequest: postRequest, accessToken: accessToken), completion: { result in
            switch result {
                case let .success(response):
                    if let responseString = String(data: response.data, encoding: .utf8) {
//                        print(responseString)
                        print("data : \(responseString.data)")
                        print("AdminService 공지글 생성 성공")
                        createResult = true
                    } else {
                        print("AdminService 공지글 생성 실패")
                    }
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
        })
        return createResult
    }
    
    /// 확인 요청 내역 공지글 목록 조회
    func getRoomRequest(roomId: Int) async throws -> RequestRoomResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .requestRoomStub1
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getRoomRequest(roomId: roomId, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(RequestRoomResponse.self, from: response.data)
                        print("AdminService - 확인 요청 내역 공지글 목록 조회 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("AdminService - 확인 요청 내역 공지글 목록 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("AdminService - 확인 요청 내역 공지글 목록 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
    
    /// 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회
    func getPostRequest(roomId: Int, postId: Int) async throws -> RequestPostResponse {
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .requestPostStub1
        }
        
        return try await withCheckedThrowingContinuation { continuation in
            provider.request(.getRoomRequest(roomId: roomId, accessToken: accessToken), completion: { result in
                switch result {
                case let .success(response):
                    do {
                        let response = try self.jsonDecoder.decode(RequestPostResponse.self, from: response.data)
                        print("AdminService - 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회 성공")
                        continuation.resume(returning: response)
                    } catch {
                        Log.network("AdminService - 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회 실패", error.localizedDescription)
                        continuation.resume(throwing: error)
                    }
                    
                case let .failure(error):
                    Log.network("AdminService - 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회 네트워킹 에러", error.localizedDescription)
                    continuation.resume(throwing: error)
                }
                
            })
        }
    }
    
    /// 대기중 요청 수락/거절
    func acceptOrRejectRequest(submitId: Int) {
        
    }
}

class StubAdminService: AdminServiceType {
    func createRoom(roomRequest: RoomRequest) async throws -> CompleteRoomResponse {
        return .comRoomResponseStub1
    }
    
    func createPost(postRequest: PostRequest) -> Bool {
        return true
    }
    
    func getRoomRequest(roomId: Int) async throws -> RequestRoomResponse {
        return .requestRoomStub1
    }
    
    func getPostRequest(roomId: Int, postId: Int) async throws -> RequestPostResponse {
        return .requestPostStub1
    }
    
    func acceptOrRejectRequest(submitId: Int) {
        
    }
}
