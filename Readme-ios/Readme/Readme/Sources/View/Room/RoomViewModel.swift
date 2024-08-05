//
//  RoomViewModel.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import Foundation
import Combine

@Observable
class RoomViewModel: ObservableObject {
    enum Action {
        case getAllNotice(roomId: Int)
    }
    
    var roomId: Int
    var myUser: UserResponse?
    var phase: Phase = .notRequested
    var postLiteResponse: PostLiteResponse?
    
    
    private var container: DIContainer
//    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, roomId: Int) {
        self.container = container
        self.roomId = roomId
    }
    
//    func send(action: Action) {
//        switch action {
//        case .getAllNotice(let roomId):
//            
//        
//        }
//    }
    
    func getAllPosts() async {
        do {
            let posts = try await container.services.roomService.getAllNotice(roomId: roomId)
            self.postLiteResponse = posts
            print("\(roomId) 공지글 전체 조회!!!!!!!")
        } catch {
            self.postLiteResponse = .stub1
            Log.network("Room VM - getAllPosts() 에러", error)
        }
    }
}
