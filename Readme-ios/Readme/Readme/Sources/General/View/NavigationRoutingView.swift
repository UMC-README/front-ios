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
            SignUpView()
        case let .mypage:
            MyPageView()
        case let .penalty:
            PenaltyView()
        case let .submit:
            Text("submit")
        case let .room(roomId):
            Text("공지방 자세히 보기 \(roomId)")
        }
    }
}
