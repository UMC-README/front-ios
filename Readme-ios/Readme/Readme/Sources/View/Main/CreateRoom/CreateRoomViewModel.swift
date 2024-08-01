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
    var photoURL: String?
    
    init(container: DIContainer) {
        self.container = container
    }
    
    /// s3 이미지 생성
    func uploadRoomImage(pickerItem: PhotosPickerItem?) async throws -> String {
        guard let pickerItem = pickerItem else {
                throw NSError(domain: "UploadRoomImageError", code: 1, userInfo: [NSLocalizedDescriptionKey: "픽커 아이템이 없습니다."])
            }
        
        do {
                let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
                let url = try await container.services.userService.uploadImage(data: data)
                if let image = url.result {
                    self.photoURL = image.image
                    print("이미지 링크 : \(self.photoURL)")
                    return photoURL!
                } else {
                    throw NSError(domain: "UploadRoomImageError", code: 2, userInfo: [NSLocalizedDescriptionKey: "이미지 URL이 없습니다."])
                }
            } catch {
                print("MainVM uploadRoomImage url 생성 실패: \(error.localizedDescription)")
                throw error
            }
    }
    
    /// 공지방 모델 생성
    func createRoomModel(adminNickname: String, roomName: String, roomPassword: String, roomImage: String?, maxPenalty: Int) {
        self.roomRequest = .init(adminNickname: adminNickname, roomName: roomName, roomPassword: roomPassword, roomImage: roomImage!, maxPenalty: maxPenalty)
            
    }
    
    /// 공지방 생성
    func createRoom() async {
        print("CreateRoomVM createRoom()")
        if let roomRequest = roomRequest {
            self.container.services.adminService.createRoom(roomRequest: roomRequest)
            print("CreateRoomVM 공지방 생성 성공")
        }
    }
    
}
