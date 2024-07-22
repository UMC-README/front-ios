//
//  AuthenticatedView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct AuthenticatedView: View {
    @StateObject var authViewModel: AuthentificationViewModel
    var body: some View {
        VStack {
            switch authViewModel.authentificationState {
            case .unauthenticated:
                SigninIntroView()
            case .authenticated:
                MainView()
            }
        }
    }
}

#Preview {
    AuthenticatedView(
        authViewModel: .init(container: .init(services: StubServices()))
    )
}
