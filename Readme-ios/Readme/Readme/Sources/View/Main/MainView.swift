//
//  MainView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct MainView: View {

    
    var body: some View {
        ZStack {
            Color.backgroundLight
            ScrollView {
                VStack(spacing: 24) {
                    createdRoomView
                    enteredRoomView
                }
                .padding(.top, 10)
                .padding(.horizontal, 16)
            }
        }
    }
    
    
    /// 생성한 공지방
    @ViewBuilder
    var createdRoomView: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        VStack(alignment: .leading, spacing: 10) {
            title("개설한 공지방")
            LazyVGrid(columns: columns) {
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
                RoomItemView(time: "30분", roomName: "공지방공지방공지방공지방공지방공지방공지방공지방공지방", nickname: "닉네임닉네임닉네임닉네임닉네임닉네임닉네임닉네임닉네임")
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
            }
        }
    }
    
    /// 입장한 공지방
    @ViewBuilder
    var enteredRoomView: some View {
        let columns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
        ]
        VStack(alignment: .leading, spacing: 10) {
            title("입장한 공지방")
            LazyVGrid(columns: columns) {
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
                RoomItemView(time: "30분", roomName: "공지방공지방공지방공지방공지방공지방공지방공지방공지방", nickname: "닉네임닉네임닉네임닉네임닉네임닉네임닉네임닉네임닉네임")
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
                RoomItemView(time: "30분", roomName: "공지방", nickname: "닉네임")
            }
        }
    }
    
    
    /// 메인 요소별 타이틀
    func title(_ title: String) -> some View {
        Text(title)
            .font(.pretendardBold20)
            .foregroundStyle(Color.txtDefault)
    }
}

#Preview {
    MainView()
}
