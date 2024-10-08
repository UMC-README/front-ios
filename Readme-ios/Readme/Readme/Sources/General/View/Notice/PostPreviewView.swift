//
//  PostPreviewView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct PostPreviewView: View {
    
    let post: PostLite
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                
                NoticeTypeIconView(type: post.postType ?? .mission)
                SubmitTypeIconView(type: post.submitState ?? .notComplete)
                Spacer()
                Text("\(post.commentCount ?? -1)")
                Text("버튼")
            }
            
            Text(post.postTitle ?? "title error")
                .font(.pretendardBold18)
                .foregroundStyle(Color.txtDefault)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text(post.startDate ?? "")
                Text("-")
                Text(post.endDate ?? "")
            }
            .foregroundStyle(Color.primaryNormal)
            .font(.pretendardRegular12)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, 8)
            .border(width: 0.33, edges: [.bottom], color: .primaryNormal)
            
            HStack {
                Text(post.postBody ?? "")
                    .frame(maxWidth: .infinity, minHeight: 60, alignment: .topLeading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .font(.pretendardMedium16)
                    .foregroundStyle(Color.txtCaption)
            }
        }
        .padding(10)
        .background(Color.primaryLight)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct PostPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        PostPreviewView(post: .postStub01)
            .previewLayout(.sizeThatFits)
    }
}
