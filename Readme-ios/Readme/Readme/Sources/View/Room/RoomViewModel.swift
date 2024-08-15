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
        case goToPost(postId: Int)
    }
    
    var roomId: Int
    var myUser: UserResponse?
    var phase: Phase = .notRequested
    var postLiteResponse: PostLiteResponse?
    
    var roomModelDestination: RoomModelDestination?
    
    var isPresentedPostEditView: Bool = false
    
    private var container: DIContainer
//    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, roomId: Int) {
        self.container = container
        self.roomId = roomId
    }
    
    func send(action: Action) {
        switch action {
        case .goToPost(let postId):
            container.navigationRouter.destinations.append(.post(postId: postId))
            
        
            
        
        }
    }
    
    func getAllPosts() async {
        do {
//            guard let roomId = roomId else { return }
            let posts = try await container.services.roomService.getAllNotice(roomId: roomId)
            postLiteResponse = posts
            
            print("\(roomId) 공지글 전체 조회!!!!!!!")
            print("posts \(posts)")
            
            
        } catch {
//            self.postLiteResponse = .stub1
            Log.network("Room VM - getAllPosts() 에러", error)
        }
    }
    
    func makePostRequest(roomID: Int, type: String, title: String, content: String, startDate: String, endDate: String, question: String, quizAnswer: String?, imgURLs: [String]) -> PostRequest {
        return .init(roomID: roomID, type: type, title: title, content: content, startDate: startDate, endDate: endDate, question: question, quizAnswer: quizAnswer, imgURLs: imgURLs)
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
