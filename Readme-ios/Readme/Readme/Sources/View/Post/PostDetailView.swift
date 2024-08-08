//
//  NoticeDetailView.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import SwiftUI

struct PostDetailView: View {
    
    var post: PostResponse = PostResponse.stub1
    var postID: Int
   
    
    // TODO: Comment
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            
            ScrollView {
                contentView
                    .padding(.horizontal, 16)
            }
            
        }
    }
    
    
    /// 공지글 본문 뷰
    @ViewBuilder
    var contentView: some View {
        VStack(spacing: 8) {
            HStack {
                
                NoticeTypeIconView(type: post.result?.postType ?? .mission)
                Spacer()
                Text("댓글 버튼 개수")
                Text("버튼")
            }
            
            Text(post.result?.postTitle ?? "title error")
                .font(.pretendardBold18)
                .foregroundStyle(Color.txtDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("yy.MM.dd HH:MM")
                Text("-")
                Text("yy.MM.dd HH:MM")
            }
            .foregroundStyle(Color.primaryNormal)
            .font(.pretendardRegular12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
            .border(width: 0.33, edges: [.bottom], color: .primaryNormal)
            
            HStack {
                Text(post.result?.postContent ?? "content error")
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .font(.pretendardMedium16)
                    .foregroundStyle(Color.txtCaption)
            }
        }
        .padding(10)
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    /// 댓글창 뷰
    @ViewBuilder
    var commentView: some View {
        VStack {
            Text("댓글")
        }
    }
}

//#Preview {
//    PostDetailView(post)
//}

