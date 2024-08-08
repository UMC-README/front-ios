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
    
    var roomId: Int?
    var myUser: UserResponse?
    var phase: Phase = .notRequested
    var postLiteResponse: PostLiteResponse?

    private var container: DIContainer
//    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
//        self.roomId = roomId
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
            guard let roomId = roomId else { return }
            let posts = try await container.services.roomService.getAllNotice(roomId: roomId)
            self.postLiteResponse = posts
            print("\(roomId) 공지글 전체 조회!!!!!!!")
        } catch {
            self.postLiteResponse = .stub1
            Log.network("Room VM - getAllPosts() 에러", error)
        }
    }
    
    func makePostRequest(roomID: Int, title: String, content: String, type: String, startDate: String, endDate: String, question: String, userID: Int, imgURLs: [String]) -> PostRequest {
        return .init(body: .init(roomID: roomID, type: type, title: title, content: content, startDate: startDate, endDate: endDate, question: ""), imgURLs: [])
    }
    
    /// 공지글 생성
    func createPost(postRequest: PostRequest) async -> Bool {
        do {
            try await container.services.adminService.createPost(postRequest: postRequest)
            print("RoomVM 공지글 생성 성공")
            return true
        } catch {
            print("RoomVM 공지글 생성 실패")
            return false
        }
    }
}
