//
//  DIContainer.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    var navigationRouter: NavigationRoutable
    
    init(
        services: ServiceType,
        navigationRouter: NavigationRoutable = NavigationRouter()
    ) {
        self.services = services
        self.navigationRouter = navigationRouter
    }
}

extension DIContainer {
    static var stub: DIContainer {
        .init(services: StubServices())
    }
}
