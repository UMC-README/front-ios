//
//  MyInfoButtonStyle.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct MyInfoButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.pretendardRegular12)
            .foregroundStyle(Color.txtCaption)
            .opacity(configuration.isPressed ? 0.5 : 1)
            .padding(8)
            .background(Color.gray1)
            .clipShape(RoundedRectangle(cornerRadius: 999))
            .overlay {
                RoundedRectangle(cornerRadius: 999)
                    .strokeBorder(Color.gray4, lineWidth: 0.33)
            }
    }
}
