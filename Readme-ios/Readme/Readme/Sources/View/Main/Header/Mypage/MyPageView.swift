//
//  MyPageView.swift
//  Readme
//
//  Created by Subeen on 7/27/24.
//

import SwiftUI

struct MyPageView: View {
    
    @StateObject var myPageViewModel: MyPageViewModel
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            ScrollView {
                VStack {
                    headerView
                    roomProfileList
                        .padding(.horizontal, 16)
                }
                .task {
                    await myPageViewModel.getAllProfile()
                }
                .refreshable {
                    await myPageViewModel.getAllProfile()
                }
            }
        }
        .navigationTitle("내 프로필 설정")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    /// 헤더
    @ViewBuilder
    var headerView: some View {
        VStack(spacing: 10) {
            defaultProfileView
                
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .border(width: 3, edges: [.bottom], color: .primaryNormal)
    }
    
    /// 프로필
    @ViewBuilder
    var defaultProfileView: some View {
        HStack {
            AsyncImage(url:
                        URL(string: "profileImage")) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 54, height: 54)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                    
                case .empty:
                    Text("none")
                case .failure(_):
                    Text("none")
                @unknown default:
                    Text("none")
                }
            }
            
            VStack(alignment: .leading) {
                Text("닉네임")
                    .font(.pretendardMedium18)
                    .foregroundStyle(Color.txtDefault)
                Text("기본 프로필")
                    .font(.pretendardRegular12)
                    .foregroundStyle(Color.txtCaption)
            }
            .padding(.vertical, 4)
            
            Spacer()
            
            Button {
                
            } label: {
                Rectangle()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.bottom, 8)
        .border(width: 0.33, edges: [.bottom], color: .primaryLight)
    }
    
    /// 공지방 프로필 목록
    @ViewBuilder
    var roomProfileList: some View {
        VStack(spacing: 8){
            Text("공지방 프로필")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendardRegular14)
                .foregroundStyle(Color.txtCaption)
            
            if myPageViewModel.userProfileResponse?.result?.profiles == nil {
                Text("프로필 없습니다.")
            } else {
                ForEach(myPageViewModel.userProfileResponse?.result?.profiles ?? []) { profile in
                    
                    roomProfileItem(profileImage: profile.profileImage ?? "", nickname: profile.nickname ?? "", roomName: profile.roomName ?? "")
                }
            }
        }
    }
    
    @ViewBuilder
    func roomProfileItem(profileImage: String, nickname: String, roomName: String) -> some View {
        HStack {
            AsyncImage(url:
                        URL(string: profileImage)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 44, height: 44)
                        .clipShape(RoundedRectangle(cornerRadius: 14))
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 0)
                    
                case .empty:
                    Text("none")
                case .failure(_):
                    Text("none")
                @unknown default:
                    Text("none")
                }
            }
            VStack(alignment: .leading) {
                Text(nickname)
                    .font(.pretendardRegular14)
                    .foregroundStyle(Color.txtDefault)
                Text(roomName)
                    .font(.pretendardRegular12)
                    .foregroundStyle(Color.txtCaption)
            }
            .padding(.vertical, 4)
            
            Spacer()
            
            Button {
                
            } label: {
                Rectangle()
                    .frame(width: 24, height: 24)
            }
        }
        .padding(.bottom, 8)
        .border(width: 0.33, edges: [.bottom], color: .primaryLight)
    }
}


struct MyPageView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        MyPageView(myPageViewModel: .init(container: container))
            .previewLayout(.sizeThatFits)
    }
}
