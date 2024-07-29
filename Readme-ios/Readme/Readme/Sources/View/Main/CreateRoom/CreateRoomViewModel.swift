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
    
    init(container: DIContainer) {
        self.container = container
    }
    
    func uploadRoomImage(pickerItem: PhotosPickerItem?) async {
        guard let pickerItem else { return }
        
        do {
            let data = try await container.services.photoPickerService.loadTransferable(from: pickerItem)
            let url = try await container.services.userService.uploadImage(data: data)
            print(url)
        } catch {
            print("MainVM uploadRoomImage url 생성 실패")
        }
    }
    
}
