//
//  NoticeDetailView.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import SwiftUI

struct PostDetailView: View {

    @EnvironmentObject var container: DIContainer
    @StateObject var postViewModel: PostViewModel
    
    // TODO: Comment
    
    var body: some View {
        
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            
            ScrollView {
                contentView
                    .padding(.horizontal, 16)
            }
        }
        .task {
            await postViewModel.getPost()
        }
    }
    
    
    /// 공지글 본문 뷰
    @ViewBuilder
    var contentView: some View {
        VStack(spacing: 8) {
            HStack {
                
                NoticeTypeIconView(type: postViewModel.post?.postType ?? .mission)
                Spacer()
//                Text("\(postViewModel.post?.commentCount)")
                Text("버튼")
            }
            
            Text(postViewModel.post?.postTitle ?? "title error")
                .font(.pretendardBold18)
                .foregroundStyle(Color.txtDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(postViewModel.post?.startDate ?? "YYYY-MM-DD HH:mm")
                Text("-")
                Text(postViewModel.post?.endDate ?? "YYYY-MM-DD HH:mm")
            }
            .foregroundStyle(Color.primaryNormal)
            .font(.pretendardRegular12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
            .border(width: 0.33, edges: [.bottom], color: .primaryNormal)
            
            HStack {
                Text(postViewModel.post?.postBody ?? "content error")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .font(.pretendardMedium16)
                    .foregroundStyle(Color.txtCaption)
            }
            
            checkNoticeButtonView
        }
        .padding(10)
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    /// 오른쪽 위 버튼 (관리자 / 일반멤버 구분)
    var settingButtonForAdmin: some View {
        HStack {
            
        }
    }
    
    var settingButtonForNormal: some View {
        HStack {
            
        }
    }
    
    var checkNoticeButtonView: some View {
        HStack {
            Spacer()
            
            Button {
                if !postViewModel.isRoomAdmin {
                    postViewModel.send(action: .goToSubmit(postId: postViewModel.postId, roomName: postViewModel.roomName))
                } else {
                    print("공지 확인 관리자모드")
                }
            } label: {
                Text("공지 확인")
                    .font(.pretendardRegular16)
                    .foregroundStyle(Color.basicWhite)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(Color.primaryNormal)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
    }
    
    /// 댓글창 뷰
    @ViewBuilder
    var commentView: some View {
        VStack {
            Text("댓글")
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        PostDetailView(postViewModel: .init(container: container, postId: 1, isRoomAdmin: true, roomName: "공지방 이름"))
            .environmentObject(container)
    }
}

