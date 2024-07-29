//
//  MainViewModel.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Combine
import SwiftUI
import PhotosUI

@Observable
class MainViewModel {
    enum Action {
        case load
        case goToSetting
        case goToAdmit
        case goToPenalty
        case goToCreateRoom
//        case goToRoom(Room)
//        case goToNotice(Notice)
    }
    
    var myUser: User?
    var fixedNotice: FixedNotice?
    var phase: Phase = .notRequested
    
    
    private var container: DIContainer
//    private var subsriptions = Set<AnyCancellable>()
    
    init(container: DIContainer) {
        self.container = container
    }
    
//    func uploadRoomImage(pickerItem: PhotosPickerItem?) async {
//        guard let pickerItem else { return }
//        
//        do {
//            let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
//            let url = try await container.services.userService.uploadImage(data: data)
//            print(url)
//        } catch {
//            print("MainVM uploadRoomImage url 생성 실패")
//        }
//    }
//    
    func send(action: Action) {
        switch action {
        case .load:
            phase = .loading
            
//            container.services.userService.getUser(completion: { result in
//                switch result {
//                case .success(let user):
//                    print("Success MainVM - load() 프로필 조회 성공")
//                    self.myUser = user
//                case .failure(let error):
//                    Log.network("Failure MainVM - load() 프로필 조회 실패)", error.localizedDescription)
//                }
//            })
            
            container.services.userService.getFixedNotice(completion: { result in
                switch result {
                case .success(let notice):
                    print("MainVM - 고정된 공지글 조회 성공")
                    self.fixedNotice = notice
                case .failure(let error):
                    Log.network("MainVM - 고정된 공지글 조회 실패)", error.localizedDescription)
                }
                
            })
            
        case .goToAdmit:
            self.container.navigationRouter.push(to: .mypage)
            
        case .goToSetting:
            self.container.navigationRouter.push(to: .mypage)
            
        case .goToPenalty:
            self.container.navigationRouter.push(to: .penalty)
        
        case .goToCreateRoom:
            self.container.navigationRouter.push(to: .createRoom)
            
        }
    }
}
