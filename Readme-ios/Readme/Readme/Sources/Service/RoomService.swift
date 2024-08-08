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
}

class StubRoomService: RoomServiceType {
    func getAllNotice(roomId: Int) async throws -> PostLiteResponse {
        return .stub1
    }
    
    
}
