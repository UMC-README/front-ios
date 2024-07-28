//
//  EmptyView.swift
//  Readme
//
//  Created by Subeen on 7/28/24.
//

import SwiftUI

struct EmptyView: View {
    var content: String = "등록된 공지방 프로필이 없습니다."
    var backgroundColor: Color = Color.primaryLight
    
    var body: some View {
        Text(content)
            .font(.pretendardMedium16)
            .foregroundStyle(Color.txtDefault)
            .frame(maxWidth: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .padding(.vertical, 24)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.primaryLightActive, lineWidth: 0.33)
            }
    }
}

struct EmptyView_PreviewViews: PreviewProvider {
    static var previews: some View {
        EmptyView()
            .previewLayout(.sizeThatFits)
    }
}
