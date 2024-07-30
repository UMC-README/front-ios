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
    func getAllNotice(roomId: Int)
}

class RoomService: RoomServiceType {
    private let jsonDecoder = JSONDecoder()
    let provider = MoyaProvider<RoomTarget>(plugins: [MoyaLoggingPlugin()])
    
    let accessToken: String? = TokenManager.shared.accessToken
    
    func getAllNotice(roomId: Int) {
      
    }
    
}

class StubRoomService: RoomServiceType {
    func getAllNotice(roomId: Int) {
        
    }
    
    
}
