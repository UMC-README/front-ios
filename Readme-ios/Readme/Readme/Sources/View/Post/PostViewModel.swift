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
        case load
    }
    
    var postResponse: PostResponse?
    var post: PostLite?
    var postId: Int
    
    private var container: DIContainer
    
    init(container: DIContainer, postId: Int) {
        self.container = container
        self.postId = postId
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
