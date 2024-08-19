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
}

class StubAdminService: AdminServiceType {
    func createRoom(roomRequest: RoomRequest) async throws -> CompleteRoomResponse {
        return .comRoomResponseStub1
    }
    
    func createPost(postRequest: PostRequest) -> Bool {
        return true
    }
}
