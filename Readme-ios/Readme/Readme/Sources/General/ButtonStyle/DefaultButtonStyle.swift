//
//  ProcessButtonStyle.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

// 기본 버튼 타입
enum DefaultButtonType {
    case blue
    case white
}

struct DefaultButtonStyle: ButtonStyle {
    
    let buttonType: DefaultButtonType
//    let textColor: Color
//    let backgroundColor: Color
    
    init(buttonType: DefaultButtonType) {
        self.buttonType = buttonType
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.pretenardMedium16)
            .padding(.vertical, 16)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .foregroundStyle(buttonType == .blue ? Color.basicWhite : Color.primaryNormal)
            .background(buttonType == .blue ? Color.primaryNormal : Color.basicWhite)
            .clipShape(
                RoundedRectangle(cornerRadius: 8)
            )
            .overlay {
                if (buttonType == .white) {
                    RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.primaryNormal, lineWidth: 0.33)

                }
            }
            .opacity(configuration.isPressed ? 0.5 : 1)
    }
}
