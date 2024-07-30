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
    func uploadImage(data: Data?) async throws -> ImageURL
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void)
    
    
    func getFixedNotice(completion: @escaping (Result<FixedNotice, ServiceError>) -> Void)
}

class UserService: UserServiceType {

    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    
    let accessToken: String? = TokenManager.shared.accessToken
    
    /// s3 이미지 url 생성
    func uploadImage(data: Data?) async throws -> ImageURL {
        var url: ImageURL = .stub01
        guard let data = data else { return url }
        
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return .stub01
        }
            provider.request(.s3Upload(data: data, accessToken: accessToken), completion: { result in
                print("data \(data)")
                switch result {
                case .success(let response):
                    do {
                        let decodedResponse = try JSONDecoder().decode(ImageURL.self, from: response.data)
                        print("response \(decodedResponse)")
                        print("성공")
                    } catch {
                        print("s3 이미지 링크 생성 실패 \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("s3 이미지 링크 생성 네트워크 오류 \(error.localizedDescription)")
                }
            })
        return url
    }
    
    /// 내 프로필 조회
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void) {
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return
        }
        
        provider.request(.getUser(accessToken: accessToken)) { result in
            switch result {
            case let .success(response):
                do {
                    let response = try self.jsonDecoder.decode(User.self, from: response.data)
                    completion(.success(response))
                } catch {
                    completion(.failure(ServiceError.error(error)))
                }
            case let .failure(error):
                completion(.failure(ServiceError.error(error)))
            }
        }
    }
    
    /// 고정된 공지 조회
    func getFixedNotice(completion: @escaping (Result<FixedNotice, ServiceError>) -> Void) {
        
        guard let accessToken = accessToken else {
            print("토큰이 존재하지 않습니다.")
            return
        }
        
        provider.request(.getFixedNotice(accessToken: accessToken)) { result in
            switch result {
            case let .success(response):
                do {
                    let response = try self.jsonDecoder.decode(FixedNotice.self, from: response.data)
                    completion(.success(response))
                } catch {
                    completion(.failure(ServiceError.error(error)))
                }
            case let .failure(error):
                completion(.failure(ServiceError.error(error)))
            }
        }
    }
}

class StubUserService: UserServiceType {
    func uploadImage(data: Data?) async throws -> ImageURL {
        return ImageURL.stub01
    }
    
    
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void) {
      
    }
    
    func getFixedNotice(completion: @escaping (Result<FixedNotice, ServiceError>) -> Void) {
        
    }
}
