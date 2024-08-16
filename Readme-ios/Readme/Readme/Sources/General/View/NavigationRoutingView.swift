//
//  NavigationRoutingView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct NavigationRoutingView: View {
    @EnvironmentObject var container: DIContainer
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case let .signUp:
            Text("signup")
        case let .mypage:
            MyPageView()
        case let .penalty:
            PenaltyView()
        case let .room(roomId, roomName):
            RoomView(roomViewModel: .init(container: container, roomId: roomId, roomName: roomName))
        case let .createRoom(userId):
            CreateRoomView(createRoomViewModel: .init(container: container), userId: userId)
        case let .post(postId, isRoomAdmin, roomName):
            PostDetailView(postViewModel: .init(container: container, postId: postId, isRoomAdmin: isRoomAdmin, roomName: roomName))
        case let .submit(postId, roomName):
            SubmitView(submitViewModel: .init(container: container, postId: postId, roomName: roomName))
        }
    }
}
