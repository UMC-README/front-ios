//
//  PostViewModel.swift
//  Readme
//
//  Created by Subeen on 8/8/24.
//

import Combine
import SwiftUI
import PhotosUI

@Observable
class PostViewModel: ObservableObject {
    enum Action {
        case goToSubmit(postId: Int, roomName: String)
    }
    
    var postResponse: PostResponse?
    var post: PostLite?
    var postId: Int
    var isRoomAdmin: Bool
    var roomName: String
    
    private var container: DIContainer
    
    init(container: DIContainer, postId: Int, isRoomAdmin: Bool, roomName: String) {
        self.container = container
        self.postId = postId
        self.isRoomAdmin = isRoomAdmin    // TODO: false -> isRoomAdmin 으로 수정하기
        self.roomName = roomName
    }
    
    /// 공지글 상세 조회
    func getPost() async {
        do {
            let postRes = try await container.services.roomService.getPost(postId: postId)
            postResponse = postRes
            post = postRes.result?.post?.first
        } catch {
            postResponse = .stub1
            Log.network("Post VM - getPost() 에러", error)
        }
    }
}

extension PostViewModel {
    func send(action: Action) {
        switch action {
        case .goToSubmit(let postId, let roomName):       /// 공지 확인
            container.navigationRouter.destinations.append(.submit(postId: postId, roomName: roomName))
        }
    }
}
