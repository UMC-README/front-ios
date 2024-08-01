//
//  NoticeDetailView.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import SwiftUI

struct NoticeDetailView: View {
    
    var notice: NoticeResponse = NoticeResponse.stub1
    
    // TODO: Comment
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            
            ScrollView {
                contentView
            }
            
        }
    }
    
    
    /// 공지글 본문 뷰
    @ViewBuilder
    var contentView: some View {
        VStack(spacing: 8) {
            HStack {
                
                NoticeTypeIconView(type: notice.type ?? .mission)
                Spacer()
                Text("댓글 버튼 개수")
                Text("버튼")
            }
            
            Text(notice.title ?? "title error")
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
                Text(notice.content ?? "content error")
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

#Preview {
    NoticeDetailView()
}


