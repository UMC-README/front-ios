//
//  DIContainer.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import Foundation

class DIContainer: ObservableObject {
    var services: ServiceType
    
    init(services: ServiceType) {
        self.services = services
    }
}
