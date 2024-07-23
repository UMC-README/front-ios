//
//  DefaultTextFieldStyle.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct DefaultTextFieldStyle: TextFieldStyle {
    
    // TODO: 텍스트 필드에 글자수 띄우기 
//    let maxLength: Int?
//    @Binding var text: String?

    // 텍스트 필드 스타일 커스텀
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            
            .font(.pretenardBold18)
            .padding(.vertical, 20)
            .padding(.leading, 18)
            .frame(maxWidth: .infinity)
            .background(Color.primaryLight)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.primaryLightActive, lineWidth: 0.33)
            }
        


    }
}

