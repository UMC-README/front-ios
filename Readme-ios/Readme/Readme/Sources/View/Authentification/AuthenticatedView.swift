//
//  AuthenticatedView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct AuthenticatedView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var authViewModel: AuthenticationViewModel
    var body: some View {
        VStack {
            switch authViewModel.authentificationState {
            case .unauthenticated:
                SignInIntroView()
                    .environmentObject(authViewModel)
            case .authenticated:
                MainView(mainViewModel: .init(container: container))
//                    .environmentObject(container)
            }
        }
    }
}

#Preview {
    AuthenticatedView(
        authViewModel: .init(container: .init(services: StubServices()))
    )
}
