//
//  MyPageView.swift
//  Readme
//
//  Created by Subeen on 7/27/24.
//

import SwiftUI

struct MyPageView: View {
    
//    var profileList: [User] = [.stub01, .stub02, .stub03, .stub04]
    
    var body: some View {
        ScrollView {
            VStack {
                headerView
                roomProfileList
                    .padding(.horizontal, 16)
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
            RoundedRectangle(cornerRadius: 12).frame(width: 54, height: 54)
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
            
            
//            if profileList.isEmpty {
//                EmptyView(content: "등록된 공지방 프로필이 없습니다.", backgroundColor: Color.primaryLight)
//            } else {
//                ForEach(profileList) { item in
//                    roomProfileItem(nickname: item.result?.nickname ?? "", roomName: item.result.roomName ?? "")
//                }
                
//                ForEach(profileList) { item in
//                    roomProfileItem(nickname: item.result?.nickname ?? "", roomName: item.result. ?? "")
//                }
//            }
        }
    }
    
    @ViewBuilder
    func roomProfileItem(nickname: String, roomName: String) -> some View {
        HStack {
            RoundedRectangle(cornerRadius: 12).frame(width: 44, height: 44)
            VStack(alignment: .leading) {
                Text("닉네임")
                    .font(.pretendardRegular14)
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
}


struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
            .previewLayout(.sizeThatFits)
    }
}
