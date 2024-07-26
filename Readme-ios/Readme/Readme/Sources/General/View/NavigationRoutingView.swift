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
            Text("mypage")
        case let .penalty:
            Text("penalty")
        case let .submit:
            Text("submit")
        case let .room(roomId):
            Text("공지글 자세히 보기 \(roomId)")
        }
    }
}
