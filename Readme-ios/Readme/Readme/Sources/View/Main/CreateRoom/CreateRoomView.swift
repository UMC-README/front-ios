//
//  CreamRoomView.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//

import SwiftUI
import PhotosUI

struct CreateRoomView: View {
    
    @EnvironmentObject var container: DIContainer
    var createRoomViewModel: CreateRoomViewModel
    @State var selectedImage: PhotosPickerItem?
    @State var uiImage: UIImage?
    
    var body: some View {
        VStack {
            if uiImage != nil {
                            Image(uiImage: uiImage!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300)
                        }
            
            PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                Text("Select a photo from PhotoPicker")
            }
            .task {
                await createRoomViewModel.uploadRoomImage(pickerItem: selectedImage)
            }
            
            HStack {
                Button {
                    Task {
                        await createRoomViewModel.uploadRoomImage(pickerItem: selectedImage)
                    }
                } label: {
                    Text("upload image")
                }
            }
        }
        .onChange(of: selectedImage, { oldValue, newValue in
            Task {
                do {
                    if let data = try await selectedImage?.loadTransferable(type: Data.self) {
                        if let uiImage = UIImage(data: data) {
                            self.uiImage = uiImage
                        }
                    }
                    await createRoomViewModel.uploadRoomImage(pickerItem: selectedImage)
                } catch {
                    print(error.localizedDescription)
                    selectedImage = nil
                }
            }
        })
//        .onChange(of: selectedImage) { result in
//                    Task {
//                        do {
//                            if let data = try await selectedImage?.loadTransferable(type: Data.self) {
//                                if let uiImage = UIImage(data: data) {
//                                    self.uiImage = uiImage
//                                }
//                            }
//                        } catch {
//                            print(error.localizedDescription)
//                            selectedImage = nil
//                        }
//                    }
//                }
    }
}

struct CreateRoomView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CreateRoomView( createRoomViewModel: .init(container: container))
            .environmentObject(container)
    }
}
