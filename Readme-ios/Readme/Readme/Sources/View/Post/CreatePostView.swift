//
//  CreatePostView.swift
//  Readme
//
//  Created by Subeen on 8/8/24.
//

import SwiftUI

struct CreatePostView: View {
    @EnvironmentObject var container: DIContainer
    @ObservedObject var roomViewModel: RoomViewModel
    
    
    var body: some View {
        Button {
            let re = roomViewModel.makePostRequest(roomID: 45, title: "한수빈 공지글 생성 test", content: "한수빈 공지글 생성 test", type: "MISSION", startDate: "0000000", endDate: "00000000", question: "queation", userID: 12, imgURLs: [])
            Task {
                print("공지글 생성!!!!!!!!!!")
                await roomViewModel.createPost(postRequest: re)
            }
        } label: {
            Text("공지글 생성")
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CreatePostView(roomViewModel: .init(container: container))
            .environmentObject(container)
    }
}
