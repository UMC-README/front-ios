//
//  ReadmeApp.swift
//  Readme
//
//  Created by Subeen on 7/21/24.
//

import SwiftUI

@main
struct ReadmeApp: App {
    
    @StateObject var container: DIContainer = .init(services: Services())
    
    var body: some Scene {
        WindowGroup {
            AuthenticatedView(authViewModel: AuthentificationViewModel(container: container))
        }
    }
}
