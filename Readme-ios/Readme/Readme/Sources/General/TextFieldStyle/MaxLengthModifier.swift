//
//  MaxLengthModifier.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct MaxLengthModifier: ViewModifier {
    
    @Binding var text: String
    let maxLength: Int
    
    // 텍스트필드 글자수
    func body(content: Content) -> some View {
        content
            .onChange(of: text) { oldValue, newValue in
                if newValue.count > maxLength {
                    text = oldValue
                }
            }
    }
}
