//
//  SubmitTypeIconView.swift
//  Readme
//
//  Created by Subeen on 8/17/24.
//

import SwiftUI

struct SubmitTypeIconView: View {
    
    var type: SubmitStateType
    
    var body: some View {
        Text(type.description)
            .font(.pretendardBold14)
            .foregroundStyle(type.foreColor)
            .padding(.vertical, 6)
            .padding(.horizontal, 10)
            .frame(width: 60)
            .background(type.backColor)
            .clipShape(RoundedRectangle(cornerRadius: 999))
    }
}

#Preview {
    SubmitTypeIconView(type: .complete)
}
