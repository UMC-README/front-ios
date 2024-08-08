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
        case let .submit:
            Text("submit")
        case let .room(roomId):
            RoomView(roomViewModel: .init(container: container, roomId: roomId))
        case let .createRoom(userId):
            CreateRoomView(createRoomViewModel: .init(container: container), userId: userId)
//        case let .createPost(roomViewModel):
//            CreatePostView(roomViewModel: roomViewModel)
        }
    }
}
