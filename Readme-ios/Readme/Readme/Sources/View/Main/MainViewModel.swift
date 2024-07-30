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
    func getUser() async {
        do {
            let user = try await container.services.userService.getUser()
            myUser = user
            print(myUser)
        } catch {
            Log.network("Main VM - getUser() 에러", error)
        }
    }
    
    func send(action: Action) {
        switch action {
        case .load:
            phase = .loading
            
            
            
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
            if let userId = self.myUser?.result?.userID {
                self.container.navigationRouter.push(to: .createRoom(userId: userId))
            }
        }
    }
}
