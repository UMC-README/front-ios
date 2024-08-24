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
        case goToPost(postId: Int, isRoomAdmin: Bool, roomName: String)
    }
    
    var roomId: Int
    var roomName: String
    
    var myUser: UserResponse?
    var phase: Phase = .notRequested
    var postLiteResponse: PostLiteResponse? /// 공지글 전체 조회
    
    
    /// Admin
    var roomModelDestination: RoomModelDestination?
    
    var isPresentedPostEditView: Bool = false
    
    var requestRoomResponse: RequestRoomResponse?   /// 확인 요청 내역이 있는 공지글 조회
    var requestPostResponse: RequestPostResponse?   /// 공지글별 확인 요청 내역 전체 조회
    
    private var container: DIContainer
    
    init(container: DIContainer, roomId: Int, roomName: String) {
        self.container = container
        self.roomId = roomId
        self.roomName = roomName
    }
    
    func send(action: Action) {
        switch action {
        case .goToPost(let postId, let isRoomAdmin, let roomName):
            container.navigationRouter.destinations.append(.post(postId: postId, isRoomAdmin: isRoomAdmin, roomName: roomName))
        }
    }
    
    func getAllPosts() async {
        do {
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
    
    
}

// Admin
extension RoomViewModel {
    
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
    
    /// 확인 요청 내역 공지글 목록 조회
    func getRoomRequest(roomId: Int) async {
        do {
            requestRoomResponse = try await container.services.adminService.getRoomRequest(roomId: roomId)
        } catch {
            Log.network("Room VM - getRoomRequest() 에러 ", error)
        }
    }
    
    /// 하나의 공지글에 대한 확인 요청 내역 (대기 or 승인 완료) 조회
    func getPostRequest(roomId: Int, postId: Int) async {
        do {
            requestPostResponse = try await container.services.adminService.getPostRequest(roomId: roomId, postId: postId)
        } catch {
            Log.network("Room VM - getPostRequest() 에러 ", error)
        }
    }
    
    /// 대기중 요청 수락/거절
    func acceptOrRejectRequest(submitId: Int, accessToken: String) {
        
    }
}
