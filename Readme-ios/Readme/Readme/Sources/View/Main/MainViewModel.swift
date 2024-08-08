//
//  MainViewModel.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Combine
import SwiftUI
import PhotosUI

@Observable
class MainViewModel: ObservableObject {
    enum Action {
        case load
        case goToSetting
        case goToAdmit
        case goToPenalty
        case goToCreateRoom
        case goToRoom(Int)
//        case goToNotice(Notice)
        case goToCreatePost /// test
    
    }
    
    var myUser: UserResponse?
    var fixedNotice: FixedPost?
    var myCreateRoom: RoomLiteResponse?
    var myJoinRoom: RoomLiteResponse?
    var phase: Phase = .notRequested
    
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    

    /// 유저 프로필 정보
    func getUser() async {
        do {
            let user = try await container.services.userService.getUser()
            myUser = user
        } catch {
            myUser = .stub01
            Log.network("Main VM - getUser() 에러", error)
        }
    }
    
    /// 내가 생성한 공지방
    func getCreateRoom() async {
        do {
            let createRoom = try await container.services.userService.getCreateRoom()
            myCreateRoom = createRoom
//            print(myCreateRoom)
        } catch {
            myCreateRoom = .stub01
            Log.network("Main VM - getCreateRoom() 에러", error)
        }
    }
    
    /// 내가 입장한 공지방
    func getJoinRoom() async {
        do {
            let createRoom = try await container.services.userService.getJoinRoom()
            myJoinRoom = myJoinRoom
//            print(myCreateRoom)
        } catch {
            myJoinRoom = .stub01
            Log.network("Main VM - getJoinRoom() 에러", error)
        }
    }
    
    
    func send(action: Action) {
        switch action {
        case .load:
//            phase = .loadin
            container.services.userService.getFixedNotice(completion: { result in
                switch result {
                case .success(let notice):
                    print("MainVM - 고정된 공지글 조회 성공")
                    self.fixedNotice = notice
                case .failure(let error):
                    Log.network("MainVM - 고정된 공지글 조회 실패)", error.localizedDescription)
                    self.fixedNotice = .stub1
                }
                
            })
            
        case .goToAdmit:
            self.container.navigationRouter.push(to: .mypage)
            
        case .goToSetting:
            self.container.navigationRouter.push(to: .mypage)
            
        case .goToPenalty:
            self.container.navigationRouter.push(to: .penalty)
        
        case .goToCreateRoom:
            if let userId = self.myUser?.result?.userID {
                self.container.navigationRouter.push(to: .createRoom(userId: userId))
            }
        case .goToRoom(let roomId):
            self.container.navigationRouter.push(to: .room(roomId: roomId))
            
        case .goToCreatePost:
            self.container.navigationRouter.push(to: .createPost)
        }
    }
}
