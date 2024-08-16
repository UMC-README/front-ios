//
//  NoticeTypeIconView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct NoticeTypeIconView: View {
    
    var type: PostType
    
    var body: some View {
        Text(type.description)
            .font(.pretendardBold14)
            .foregroundStyle(type.foreColor)
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .frame(width: 60)
            .background(type.backColor)
            .clipShape(RoundedRectangle(cornerRadius: 999))
            .overlay {
                if type == .quiz {
                    RoundedRectangle(cornerRadius: 999)
                        .strokeBorder(type.foreColor, lineWidth: 2)
                }
            }
    }
}

#Preview {
    NoticeTypeIconView(type: .quiz)
}
