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
    
    private var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
    /// 공지글 조회
    func getPost() async {

    }
}
