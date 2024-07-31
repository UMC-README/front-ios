//
//  PostPreviewView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct NoticePreviewView: View {
    
    let notice: NoticeResponse
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                
                NoticeTypeIconView(type: notice.type ?? .mission)
                Spacer()
                Text("댓글 버튼 개수")
                Text("버튼")
            }
            
            Text("Title")
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
                Text("content")
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

//#Preview {
//    PostPreviewView()
//}

struct PostPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        NoticePreviewView(notice: .stub1)
            .previewLayout(.sizeThatFits)
    }
}
