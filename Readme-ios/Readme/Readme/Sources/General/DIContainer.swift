//
//  DIContainer.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    var navigationRouter: NavigationRoutable & ObservableObjectSettable
    
    init(
        services: ServiceType,
        navigationRouter: NavigationRoutable & ObservableObjectSettable = NavigationRouter()
    ) {
        self.services = services
        self.navigationRouter = navigationRouter
        
        self.navigationRouter.setObjectWillChange(objectWillChange)
    }
}

extension DIContainer {
    static var stub: DIContainer {
        .init(services: StubServices())
    }
}
