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
    func createRoom(roomRequest: RoomRequest) -> Bool   /// 운영진 공지방 생성
    func createPost(postRequest: PostRequest) -> Bool   /// 운영진 공지글 생성
}

class AdminService: AdminServiceType {
    private let jsonDecoder = JSONDecoder()
    
    let provider = MoyaProvider<AdminTarget>(plugins: [MoyaLoggingPlugin()])
    
    
    
    /// 공지방 생성
    func createRoom(roomRequest: RoomRequest) -> Bool {
        var createResult = false
        let accessToken: String? = TokenManager.shared.accessToken
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return createResult
        }
        
        provider.request(.createRoom(roomRequest: roomRequest, accessToken: accessToken), completion: { result in
            switch result {
                case let .success(response):
                    if let responseString = String(data: response.data, encoding: .utf8) {
//                        print(responseString)
                        print("data : \(responseString.data)")
                        print("AdminService 공지방 생성 성공")
                        createResult = true
                    } else {
                        print("AdminService 공지방 생성 실패")
                    }
                case let .failure(error):
                    print("Error: \(error.localizedDescription)")
                }
        })
        return createResult
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
    func createRoom(roomRequest: RoomRequest) -> Bool {
        return true
    }    
    
    func createPost(postRequest: PostRequest) -> Bool {
        return true
    }
}
