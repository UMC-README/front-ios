//
//  RoomView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct RoomView: View {
    
    @EnvironmentObject var container: DIContainer
    @StateObject var roomViewModel: RoomViewModel
    
    
    var example: [PostResponse] = [
        .stub1,
        .stub1,
        .stub1,
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                Text("roomId : \(roomViewModel.roomId ?? 45)")
                noticeListView
            }
            .padding(.horizontal, 16)
            .task {
                await roomViewModel.getAllPosts()
            }
        }
    }
    
    /// 공지글 미리보기 목록
    @ViewBuilder
    var noticeListView: some View {
        VStack {
            ForEach(roomViewModel.postLiteResponse?.result?.postData ?? []) { post in
                PostPreviewView(post: post)
            }
        }
    }
}

struct RoomView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        RoomView(roomViewModel: .init(container: container))
            .environmentObject(container)
    }
}
