//
//  CreateRoomViewModel.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//

import Combine
import SwiftUI
import PhotosUI

@Observable
class CreateRoomViewModel: ObservableObject {
    
    enum Action {
        case goToRoom       /// 공지방으로 이동
        case goToMain       /// 메인으로 이동
    }
    
    var selectedImage: PhotosPickerItem?
    
    private var container: DIContainer
    private var roomRequest: RoomRequest?   /// 공지방 생성 요청
    var imageResponse: ImageURLResponse?
    var photoURL: String?
    var showCompleteView: Bool = false
    var roomResponse: CompleteRoomResponse? /// 공지방 완성 후
    
    init(container: DIContainer) {
        self.container = container
    }

}

extension CreateRoomViewModel {
    
    /// 공지방 생성 완료 후 화면 이동
    func send(action: Action) {
        switch action {
        case .goToRoom:
            print("공지방으로 이동")
        case .goToMain:
            container.navigationRouter.popToRootView()
        }
    }
    
    /// 클립보드
    func copyInviteURL(url: String) {
        UIPasteboard.general.string = url
    }
    
    /// s3 이미지 생성
    func uploadRoomImage(pickerItems: [PhotosPickerItem]?) async throws {
        guard let pickerItems = pickerItems else {
                throw NSError(domain: "UploadRoomImageError", code: 1, userInfo: [NSLocalizedDescriptionKey: "픽커 아이템이 없습니다."])
            }
        var pickerItemsList = [Data]()
        
        
        do {
            for (index, pickerItem) in pickerItems.enumerated() {
                let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
                
                pickerItemsList.append(data)
            }
            
            imageResponse = try await container.services.userService.uploadImage(data: pickerItemsList)

            } catch {
                print("MainVM uploadRoomImage url 생성 실패: \(error.localizedDescription)")
                throw error
            }
    }
    
    /// 공지방 모델 생성
    func createRoomModel(adminId: Int, adminNickname: String, roomName: String, roomPassword: String, roomImage: [String], maxPenalty: Int) {
        self.roomRequest = .init(adminId: adminId, adminNickname: adminNickname, roomName: roomName, roomPassword: roomPassword, roomImage: roomImage, maxPenalty: maxPenalty)
    }
    
    /// 공지방 생성
    func createRoom() async -> Bool {
        print("CreateRoomVM createRoom()")
        if let roomRequest = roomRequest {
            do {
                self.roomResponse = try await self.container.services.adminService.createRoom(roomRequest: roomRequest)
                print("CreateRoomVM 공지방 생성 성공")
                self.showCompleteView = true
                
                return true
            } catch {
                Log.network("CreateRoomVM 공지방 생성 실패", error)
            }
        }
        print("CreateRoomVM 공지방 생성 실패")
        return false
    }
}
