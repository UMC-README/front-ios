//
//  SubmitHistoryViewModel.swift
//  Readme
//
//  Created by Subeen on 8/20/24.
//

import Foundation

@Observable
class SubmitHistoryViewModel: ObservableObject {
    
    var container: DIContainer
    
    init(container: DIContainer) {
        self.container = container
    }
    
}
