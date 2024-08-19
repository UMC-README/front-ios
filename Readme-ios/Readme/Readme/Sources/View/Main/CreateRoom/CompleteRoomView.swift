//
//  CompleteRoomView.swift
//  Readme
//
//  Created by Subeen on 8/20/24.
//

import SwiftUI

struct CompleteRoomView: View {
    
    @EnvironmentObject var container: DIContainer
    @ObservedObject var createRoomViewModel: CreateRoomViewModel
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            contentView
        }
    }
    
    var contentView: some View {
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
            itemView(title: "초대 URL", item: (response?.result?.roomInviteUrl!)!)
//            itemView(title: "공지방 이름", item: (response?.roomName!)!)
//            itemView(title: "비밀번호", item: (response?.roomPassword!)!)
//            itemView(title: "대표자", item: (response?.adminNickname!)!)
            
            
//            itemView(title: "초대 URL", item: (createRoomViewModel.roomResponse?.roomInviteUrl)!)
//            itemView(title: "공지방 이름", item: (response?.roomName!)!)
//            itemView(title: "비밀번호", item: (response?.roomPassword!)!)
//            itemView(title: "대표자", item: (response?.adminNickname!)!)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .background(Color.primaryLight)
    }
    
    func itemView(title: String, item: String) -> some View {
        HStack {
            Text(title)
                .font(.pretendardBold18)
                .foregroundStyle(Color.primaryDark)
            Text(item)
                .font(.pretendardRegular14)
            .foregroundStyle(Color.txtDefault)
        }
    }
    
    var buttonView: some View {
        VStack {
            
        }
    }
}

struct CompleteRoomView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CompleteRoomView(createRoomViewModel: .init(container: container))
//            .environmentObject(container)
    }
}
