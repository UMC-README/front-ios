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
//    func getProfile() async throws
//    func getProfile() -> AnyPublisher<User, ServiceError>
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void)
//    func getProfile()
}

class UserService: UserServiceType {

    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<UserTarget>(plugins: [MoyaLoggingPlugin()])
    
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
    
}

class StubUserService: UserServiceType {
    func getUser(completion: @escaping (Result<User, ServiceError>) -> Void) {
      
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
