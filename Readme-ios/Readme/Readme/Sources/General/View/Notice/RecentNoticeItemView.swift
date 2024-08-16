//
//  RecentNoticeItemView.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import SwiftUI

struct RecentNoticeItemView: View {
    
    var roomName: String
    var noticeTitle: String
    var time: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            Text(roomName)
                .frame(width: 82, alignment: .leading)
                .font(.pretendardRegular12)
                .foregroundStyle(Color.txtCaption)
                
            Text(noticeTitle)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.pretendardRegular14)
                .foregroundStyle(Color.txtDefault)
            Text(time)
                .font(.pretendardRegular10)
                .foregroundStyle(Color.txtCaption)
        
        }
        .lineLimit(1)
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .border(width: 0.33, edges: [.bottom], color: Color.txtCaption)
    }
}

#Preview {
    RecentNoticeItemView(roomName: "공지방 이름공지방 이름공지방 이름공지방 이름", noticeTitle: "공지글", time: "1분 전")
}
