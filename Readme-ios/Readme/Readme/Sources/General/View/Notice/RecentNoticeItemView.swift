//
//  RecentNoticeItemView.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import SwiftUI

struct RecentNoticeItemView: View {
    
    var postResult: RecentPostResult
    
    var body: some View {
        
        ForEach (0..<5, id: \.self) { index in
            if postResult.recentPostList!.count > index {
                let postList = postResult.recentPostList!
                recentPostItemView(post: postList[index])
            } else {
                blankPostItemView
            }
        }
        
    }
    
    @ViewBuilder
    func recentPostItemView(post: RecentPost) -> some View {
        HStack(alignment: .center, spacing: 4) {
            Text(post.roomName!)
                .frame(width: 82, alignment: .leading)
                .font(.pretendardRegular12)
                .foregroundStyle(Color.txtCaption)
                
            Text(post.title!)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendardRegular14)
                .foregroundStyle(Color.txtDefault)
            Text(post.createdAt!)
                .font(.pretendardRegular10)
                .foregroundStyle(Color.txtCaption)
        
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .border(width: 0.33, edges: [.bottom], color: Color.txtCaption)
    }
    
    @ViewBuilder
    var blankPostItemView: some View {
        HStack(alignment: .center, spacing: 4) {
            Text("")
                .frame(maxWidth: .infinity)
                .font(.pretendardRegular14)
        
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .border(width: 0.33, edges: [.bottom], color: Color.txtCaption)
    }
}

#Preview {
    RecentNoticeItemView(postResult: .recentPostResultStub1)
}
