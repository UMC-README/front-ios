//
//  TextField+Extension.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

extension TextField {
    // 텍스트필드의 최대 글자수 지정
    func maxLength(text: Binding<String>, _ maxLength: Int) -> some View {
        return ModifiedContent(content: self,
                               modifier: MaxLengthModifier(text: text,
                                                           maxLength: maxLength))
    }
}
