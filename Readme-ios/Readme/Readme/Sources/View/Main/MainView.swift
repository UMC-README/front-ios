//
//  MainView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var container: DIContainer
    var mainViewModel: MainViewModel
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destinations) {
            mainContentView
                .navigationDestination(for: NavigationDestination.self) {
                    NavigationRoutingView(destination: $0)
                }
        }
    }
    
    /// 메인 콘텐츠
    @ViewBuilder
    var mainContentView: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            ScrollView {
                VStack(spacing: 24) {
                    headerView
                    pinnedNotice
                    recentNoticeView
                    createdRoomView
                    enteredRoomView
                }
                .padding(.top, 10)
                .padding(.horizontal, 16)
            }
        }
    }
    
    /// 헤더
    @ViewBuilder
    var headerView: some View {
        HStack {
            
            Spacer()
            
            HStack(spacing: 4) {
                Button {

                    mainViewModel.send(action: .goToSetting)
                } label: {
                    HStack {
                        Rectangle().frame(width: 16, height: 16)
                        Text("확인 요청 내역")
                    }
                }
                .buttonStyle(MyInfoButtonStyle())
                
                Button {
                    
                } label: {
                    HStack {
                        Rectangle().frame(width: 16, height: 16)
                        Text("페널티")
                    }
                }
                .buttonStyle(MyInfoButtonStyle())
            }
        }
    }
    
    /// 고정 공지
    @ViewBuilder
    var pinnedNotice: some View {
        HStack(alignment: .top, spacing: 8) {
            // TODO: icon 수정
            Rectangle()
                .frame(width: 14, height: 14)
            VStack(alignment: .leading, spacing: 8) {
                Text("공지글 제목")
                    .font(.pretendardBold16)
                    .foregroundStyle(Color.txtDefault)
                Text("공지글 날짜")
                    .font(.pretendardRegular12)
                    .foregroundStyle(Color.primaryNormal)
            }
            Spacer()
            Rectangle()
                .frame(width: 14, height: 14)
        }
        .padding(10)
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.primaryLightActive, lineWidth: 0.33)
        }
    }
    
    /// 최근 공지
    @ViewBuilder
    var recentNoticeView: some View {
        VStack(alignment: .leading, spacing: 10) {
            title("최근 공지")
            VStack(spacing: 0) {
                // TODO : For Each
                RecentNoticeItemView(roomName: "예시 공지방 이름", noticeTitle: "예시 공지글 제목", time: "1분 전")
                RecentNoticeItemView(roomName: "예시 공지방 이름", noticeTitle: "예시 공지글 제목", time: "1분 전")
                RecentNoticeItemView(roomName: "예시 공지방 이름", noticeTitle: "예시 공지글 제목", time: "1분 전")
                RecentNoticeItemView(roomName: "예시 공지방 이름", noticeTitle: "예시 공지글 제목", time: "1분 전")
                RecentNoticeItemView(roomName: "예시 공지방 이름", noticeTitle: "예시 공지글 제목", time: "1분 전")
                
                // TODO: 최근 공지 좌우 페이징 버튼 수정
                HStack {
                    Button {
                        
                    } label: {
                        Text("<")
                    }
                    Button {
                        
                    } label: {
                        Text(">")
                    }
                }
                .padding(.horizontal, 8)
            }
            .border(width: 0.33, edges: [.top, .bottom], color: Color.primaryNormal)
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

struct MainView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        MainView(mainViewModel: .init(container: container))
            .environmentObject(container)
    }
}
