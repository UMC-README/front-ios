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
//    func uploadImage(completion: @escaping (Result <ImageURL, ServiceError>) -> Void)
//    func uploadImage(data: Data) async throws -> URL
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void)
    
    
    func getFixedNotice(completion: @escaping (Result<FixedNotice, ServiceError>) -> Void)
}

class UserService: UserServiceType {

    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    
    let accessToken: String? = TokenManager.shared.accessToken
    func uploadImage(data: Data?) async throws -> ImageURL {
        guard let data = data else { return ImageURL() }
        var url: ImageURL = .init()
        
        provider.request(.s3Upload(data: data, accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJwcm92aWRlciI6IlJFQURNRSIsImlhdCI6MTcyMjI2OTM5MSwiZXhwIjoxNzIyMjgwMTkxfQ.RbtGWydu2xV-Avo8Vo-3OG0e7H2SFHeHQdRmpoMu8XU"), completion: { result in
            
            switch result {
            case let .success(response):
                do {
                    let response = try self.jsonDecoder.decode(ImageURL.self, from: response.data)
                    url = response
                } catch {
                    
                }
            case let .failure(error):
                url = ImageURL.stub01
            
            }
        })
        
        return url
    }
    
    /// 내 프로필 조회
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void) {
        provider.request(.getUser(accessToken: "")) { result in
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
    
    func getFixedNotice(completion: @escaping (Result<FixedNotice, ServiceError>) -> Void) {
        provider.request(.getFixedNotice(accessToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjEyLCJwcm92aWRlciI6IlJFQURNRSIsImlhdCI6MTcyMjI2OTM5MSwiZXhwIjoxNzIyMjgwMTkxfQ.RbtGWydu2xV-Avo8Vo-3OG0e7H2SFHeHQdRmpoMu8XU")) { result in
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

 
        
//        let response = provider.request(.profile(accessToken: "")) { result in
//            switch result {
//            case .success(let response):
//                do {
//                    let user = try JSONDecoder().decode(User.self, from: response.data)
//                    completion(.success(user))
//                } catch let error {
//                    completion(.failure(error))
//                }
//            case .failure(let error):
//                completion(.failure(error))
//            }
//        }
//    }
//}
