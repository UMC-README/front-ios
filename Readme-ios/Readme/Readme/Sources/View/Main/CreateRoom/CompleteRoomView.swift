//
//  CompleteRoomView.swift
//  Readme
//
//  Created by Subeen on 8/20/24.
//

import SwiftUI

/// 공지방 생성 완료 뷰
struct CompleteRoomView: View {
    
    @EnvironmentObject var container: DIContainer
    @ObservedObject var createRoomViewModel: CreateRoomViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundLight.ignoresSafeArea(.all)
                VStack {
                    contentView
                    
                    Spacer()
                    
                    buttonView
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("READ.ME")
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        VStack {
            Text("리드미 완성 🎉")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendardBold16)
                .foregroundStyle(Color.basicWhite)
                .padding(.vertical, 8)
                .padding(.horizontal, 13)
                .background(Color.primaryNormal)
                
            
            VStack {
                let response = createRoomViewModel.roomResponse
                AsyncImage(url: URL(string: "")) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 200, height: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    case .empty:
                        Text("none")
                    case .failure(_):
                        Text("none")
                    @unknown default:
                        Text("none")
                    }
                }
                
                VStack(alignment: .leading, spacing: 6) {
                    HStack {
                        itemView(title: "초대 URL", item: response?.result?.roomInviteUrl ?? "")
                        Button {    // 초대 URL 복사
                            createRoomViewModel.copyInviteURL(url: response?.result?.roomInviteUrl ?? "")
                        } label: {
                            Text("복사")
                        }
                    }
                    itemView(title: "공지방 이름", item: response?.result?.roomName ?? "")
                    itemView(title: "비밀번호", item: response?.result?.roomPassword ?? "")
                    itemView(title: "대표자", item: response?.result?.adminNickname ?? "")
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
        }
        .frame(maxWidth: .infinity)
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.primaryNormal, lineWidth: 0.33)
        }
    }
    
    @ViewBuilder
    func itemView(title: String, item: String) -> some View {
        HStack(spacing: 10) {
            Text(title)
                .font(.pretendardBold18)
                .foregroundStyle(Color.primaryDark)
            Text(item)
                .font(.pretendardRegular14)
            .foregroundStyle(Color.txtDefault)
        }
        .padding(10)
    }
    
    var buttonView: some View {
        VStack(spacing: 10) {
            Button {
                createRoomViewModel.send(action: .goToRoom)
            } label: {
                Text("공지방으로 이동")
            }
            .buttonStyle(DefaultButtonStyle(buttonType: .blue))
            
            Button {
                createRoomViewModel.send(action: .goToMain)
            } label: {
                Text("메인으로 이동")
            }
            .buttonStyle(DefaultButtonStyle(buttonType: .white))
        }
    }
}

struct CompleteRoomView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CompleteRoomView(createRoomViewModel: .init(container: container))
            .environmentObject(container)
    }
}
