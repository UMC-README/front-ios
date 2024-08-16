//
//  SceneDelegate.swift
//  Readme
//
//  Created by Subeen on 8/2/24.
//

import Foundation
import KakaoSDKAuth
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
}
