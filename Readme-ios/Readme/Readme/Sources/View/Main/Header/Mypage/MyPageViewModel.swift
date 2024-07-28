//
//  MyPageViewModel.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import Foundation

@Observable
class MyPageViewModel {
    
    enum Action {
        case getMyAllProfile
        case goDefaultProfile
        case goRoomProfile
    }
    
    
    var user: User?             // 기본 프로필
    var roomUser: [User]?       // 공지방 프로필 목록
    var phase: Phase = .notRequested
    
    var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(action: Action) {
        switch action {
        case .getMyAllProfile:
            break
        case .goDefaultProfile:
            break
        case .goRoomProfile:
            break
        }
    }
    
}
