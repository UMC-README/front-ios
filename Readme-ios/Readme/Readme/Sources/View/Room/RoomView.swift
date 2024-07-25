//
//  RoomView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct RoomView: View {
    
    
    var example: [Notice] = [
        .init(title: "공지방 예시", content: "공지글 내용 예시입니다. 공지글 내용 예시입니다. 공지글 내용 예시입니다. 공지글 내용 예시입니다.", type: .mission),
        .init(title: "공지방 예시", content: "공지글 내용 예시입니다. 공지글 내용 예시입니다. 공지글 내용 예시입니다. 공지글 내용 예시입니다.", type: .quiz),
        .init(title: "공지방 예시", content: "공지글 내용 예시입니다. 공지글 내용 예시입니다. 공지글 내용 예시입니다. 공지글 내용 예시입니다.", type: .mission),
    
    
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                noticeListView
            }
            .padding(.horizontal, 16)
        }
    }
    
    /// 공지글 미리보기 목록
    @ViewBuilder
    var noticeListView: some View {
        VStack {
            ForEach(example) { notice in
                NoticePreviewView(notice: notice)
            }
        }
    }
}

#Preview {
    RoomView()
}
