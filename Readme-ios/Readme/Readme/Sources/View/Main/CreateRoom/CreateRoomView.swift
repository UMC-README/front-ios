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
    @State var photoURL: String?
    
    var userId: Int
    
    @State var adminName: String = ""
    @State var roomName: String = ""
    @State var roomPassword: String = ""
    @State var penalty: String = "" /// Int로 형변환 후 전달
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            contentView
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        VStack {
            imageUploadView
            enterField
            Spacer()
            buttonView
        }
        .padding(.horizontal, 16)
        .padding(.top, 10)
        .navigationTitle("공지방 생성")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    var imageUploadView: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                if uiImage != nil {
                    Image(uiImage: uiImage!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                } else {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 140, height: 140)
                }
                PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                    Image(systemName: "plus")
                        .padding(4)
                        .background(Color.primaryLight)
                        .clipShape(Circle())
                        .padding(.bottom, 10)
                        .padding(.trailing, 10)
                        
                }
                .task {
                    photoURL = try? await createRoomViewModel.uploadRoomImage(pickerItem: selectedImage)
                    print(photoURL)
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
                    try await createRoomViewModel.uploadRoomImage(pickerItem: selectedImage)
                } catch {
                    print(error.localizedDescription)
                    selectedImage = nil
                }
            }
        })
    }
    
    
    /// 공지방 설정을 위한 입력 필드뷰
    @ViewBuilder
    var enterField: some View {
        VStack(alignment: .center, spacing: 30) {
            
            VStack(alignment: .leading, spacing: 10) {
                Text("단체 정보")
                    .font(.pretendardBold18)
                
                TextField(
                    "",
                    text: $adminName,
                    prompt: Text("관리자 이름")
                )
                .textFieldStyle(DefaultTextFieldStyle())
            }
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("공지방 설정")
                    .font(.pretendardBold18)
                
                TextField(
                    "",
                    text: $roomName,
                    prompt: Text("공지방 이름")
                )
                .maxLength(text: $roomName, 20)
                .textFieldStyle(DefaultTextFieldStyle())
                .overlay {
                    HStack {
                        Spacer()
                        Text("(\(roomName.count)/\(20))")
                            .font(.pretendardRegular12)
                            .foregroundStyle(Color.txtCaption)
                            .padding(.trailing, 18)
                    }
                }
                
                TextField(
                    "",
                    text: $roomPassword,
                    prompt: Text("비밀번호")
                )
                .maxLength(text: $roomPassword, 20)
                .textFieldStyle(DefaultTextFieldStyle())
                .overlay {
                    HStack {
                        Spacer()
                        Text("(\(roomPassword.count)/\(20))")
                            .font(.pretendardRegular12)
                            .foregroundStyle(Color.txtCaption)
                            .padding(.trailing, 18)
                    }
                }
                
                TextField(
                    "",
                    text: $penalty,
                    prompt: Text("페널티 개수")
                )
                .maxLength(text: $penalty, 20)
                .textFieldStyle(DefaultTextFieldStyle())
                .overlay {
                    HStack {
                        Spacer()
                    }
                }
            }
        }
    }
    
    /// 버튼뷰
    @ViewBuilder
    var buttonView: some View {
        Button {
            Task {
                createRoomViewModel.createRoomModel(
                    adminID: userId,
                    adminNickname: adminName,
                    roomName: roomName,
                    roomPassword: roomPassword,
                    roomImage: createRoomViewModel.photoURL,
                    inviteURL: "text.com",
                    maxPenalty: Int(penalty)!
                )
                
                await createRoomViewModel.createRoom()
            }
        } label: {
            Text("생성하기")
        }
        .disabled(adminName.isEmpty || roomName.isEmpty || penalty.isEmpty)
        .buttonStyle(ConfirmButtonStyle(buttonType: .blue))
        
    }
}

struct CreateRoomView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CreateRoomView( createRoomViewModel: .init(container: container), userId: 12)
            .environmentObject(container)
    }
}
