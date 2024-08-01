//
//  RoomViewModel.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import Foundation
import Combine

@Observable
class RoomViewModel: ObservableObject {
    enum Action {
        case getAllNotice(roomId: Int)
    }
    
    var roomId: Int
    var myUser: UserResponse?
    var phase: Phase = .notRequested
    var notice: [NoticeResponse] = []
    
    
    private var container: DIContainer
//    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer, roomId: Int) {
        self.container = container
        self.roomId = roomId
    }
    
    func send(action: Action) {
        switch action {
        case .getAllNotice(let roomId):
            break
        
        }
    }
}
