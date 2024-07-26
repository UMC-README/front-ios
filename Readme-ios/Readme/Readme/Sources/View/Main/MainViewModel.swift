//
//  MainViewModel.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Combine

@Observable
class MainViewModel {
    enum Action {
        case load
//        case goToSetting
//        case goToAdmit
//        case goToPenalty
//        case goToRoom(Room)
//        case goToNotice(Notice)
    }
    
    var myUser: User?
    
    var phase: Phase = .notRequested
    
    
    private var container: DIContainer
    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(action: Action) {
        switch action {
        case .load:
            phase = .loading
            
            container.services.userService.getProfile(completion: { result in
                switch result {
                case .success(let user):
                    print("Success MainVM - load()")
                    self.myUser = user
                case .failure(let error):
                    Log.network("Failure MainVM - load()", error.localizedDescription)
                }
            })
        }
        
    }
}
