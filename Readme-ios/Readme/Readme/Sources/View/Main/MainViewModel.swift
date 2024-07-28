//
//  MainViewModel.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Combine

@Observable
class MainViewModel: ObservableObject {
    enum Action {
        case load
        case goToSetting
        case goToAdmit
        case goToPenalty
//        case goToRoom(Room)
//        case goToNotice(Notice)
    }
    
    var myUser: User?
    var phase: Phase = .notRequested
    
    
    private var container: DIContainer
//    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func send(action: Action) {
        switch action {
        case .load:
            phase = .loading
            
            container.services.userService.getUser(completion: { result in
                switch result {
                case .success(let user):
                    print("Success MainVM - load() 프로필 조회 성공")
                    self.myUser = user
                case .failure(let error):
                    Log.network("Failure MainVM - load() 프로필 조회 실패)", error.localizedDescription)
                }
            })
            
        case .goToAdmit:
            self.container.navigationRouter.push(to: .mypage)
            
        case .goToSetting:
            self.container.navigationRouter.push(to: .mypage)
            
        case .goToPenalty:
            self.container.navigationRouter.push(to: .penalty)
        }
    }
}
