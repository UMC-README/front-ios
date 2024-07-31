//
//  ConfirmButtonStyle.swift
//  Readme
//
//  Created by Subeen on 7/31/24.
//

import SwiftUI

// 기본 버튼 타입
enum ConfirmButtonType: String {
    case blue
    case red
    
}

struct ConfirmButtonStyle: ButtonStyle {
    
    let buttonType: ConfirmButtonType
    
    init(buttonType: ConfirmButtonType) {
        self.buttonType = buttonType
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.pretendardMedium16)
            .padding(.vertical, 16)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .foregroundStyle(buttonType == .blue ? Color.basicWhite : Color.danger)
            .background(buttonType == .blue ? Color.primaryNormal : Color.dangerLight)
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
