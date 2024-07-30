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
class CreateRoomViewModel {
    
    var selectedImage: PhotosPickerItem?
    
    private var container: DIContainer
    private var roomRequest: RoomRequest?
    private var photoURL: String?
    
    init(container: DIContainer) {
        self.container = container
    }
    
    /// s3 이미지 생성
    func uploadRoomImage(pickerItem: PhotosPickerItem?) async {
        guard let pickerItem else { return }
        
        do {
               let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
               let url = try await container.services.userService.uploadImage(data: data)
               if let image = url.result {
                   self.photoURL = image.image
               }
               print(self.photoURL)
           } catch {
               print("MainVM uploadRoomImage url 생성 실패: \(error.localizedDescription)")
           }
    }
    
    /// 공지방 생성
    func createRoom(adminID: Int, adminNickname: String, roomName: String, roomPassword: String, roomImage: String?, inviteURL: String, maxPenalty: Int) {
        
        self.roomRequest = .init(adminID: adminID, adminNickname: adminNickname, roomName: roomName, roomPassword: roomPassword, roomImage: roomImage, inviteURL: photoURL, maxPenalty: 10)
        
        container.services.adminService.createRoom(roomRequest: roomRequest!)
    }
    
}
