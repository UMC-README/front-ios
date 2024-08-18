//
//  MyPageViewModel.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import Foundation

@Observable
class MyPageViewModel: ObservableObject {
    
    enum Action {
        case getMyAllProfile
        case goDefaultProfile
        case goRoomProfile
    }
    
    
    var user: UserResponse?             // 기본 프로필
//    var roomUser: [UserResponse]?       // 공지방 프로필 목록
    var userProfileResponse: UserProfileResponse?   // 내 프로필 전체 조회
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


extension MyPageViewModel {
    func getAllProfile() async {
        do {
            userProfileResponse = try? await container.services.userService.getAllProfile()
        } catch {
            Log.network("Mypage VM - getAllProfile() 실패", error)
        }
    }
}
