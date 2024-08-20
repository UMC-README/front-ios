//
//  ReadmeApp.swift
//  Readme
//
//  Created by Subeen on 7/21/24.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth

@main
struct ReadmeApp: App {
    
    @StateObject var container: DIContainer = .init(services: Services())
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "472801b2881a04fd9974a8c91eebff98")
    }
    
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: AuthenticationViewModel(container: container))
                .environmentObject(container)
            //                .onOpenURL(perform: { url in
            //                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
            //                        AuthController.handleOpenUrl(url: url)
            //                    }
            //                }
//            )
        }
    }

}
