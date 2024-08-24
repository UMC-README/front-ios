//
//  RequestHistoryView.swift
//  Readme
//
//  Created by Subeen on 8/20/24.
//

import SwiftUI

struct RequestHistoryView: View {
    
    @ObservedObject var roomViewModel: RoomViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundLight.ignoresSafeArea(.all)
                ScrollView {
                    contentView
                        .padding(.horizontal, 16)
                }
            }
            .navigationTitle("확인 요청 내역")
            .toolbarTitleDisplayMode(.inline)
        }
    }
    
    @ViewBuilder
    var contentView: some View {
        LazyVStack {
            if (roomViewModel.requestRoomResponse?.result?.isEmpty ?? false) {
                EmptyView(content: "확인 요청 내역이 없습니다.")
            } else {
                ForEach(roomViewModel.requestRoomResponse?.result ?? []) { post in
                    
                }
            }
        }
    }
    
    @ViewBuilder
    func postItem(post: RequestRoomResult) -> some View {
        VStack {
            Text(post.title ?? "")
                .font(.pretendardBold18)
            Text("\(post.startDate ?? "") - \(post.endDate ?? "")")
        }
    }
}

struct RequestHistoryView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        RequestHistoryView(roomViewModel: .init(container: container, roomId: 45, roomName: "공지방 이름"))
            .environmentObject(container)
    }
}
