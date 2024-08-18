//
//  AuthenticatedView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

struct AuthenticatedView: View {
    @EnvironmentObject var container: DIContainer
    @StateObject var authViewModel: AuthenticationViewModel
    var body: some View {
        VStack {
            switch authViewModel.authentificationState {
            case .unauthenticated:
                SignInIntroView()
                    .environmentObject(authViewModel)
                    .onOpenURL(perform: { url in
                                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                                        AuthController.handleOpenUrl(url: url)
                                    }
                                })
            case .completeSignup:
                Text("회원가입 완료")
                
            case .authenticated:
                MainView(mainViewModel: .init(container: container))
            }
        }
    }
}

#Preview {
    AuthenticatedView(
        authViewModel: .init(container: .init(services: StubServices()))
    )
}
