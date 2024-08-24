//
//  SmallDatePickerStyle.swift
//  Readme
//
//  Created by Subeen on 8/10/24.
//

import Foundation
import SwiftUI

struct SmallDatePickerStyle: DatePickerStyle {

    var date: Date?
    @Binding var isDatePickerVisible: Bool
    
    func makeBody(configuration: Configuration) -> some View {
//        Text(date, formatter: DateFormatter.customFormatter)
        Text(date.map { DateFormatter.customFormatter.string(from: $0) } ?? "yy.mm.dd HH:mm")
            .foregroundStyle(Color.txtDefault)
            .font(.pretendardMedium16)
            .padding(.horizontal, 8)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(Color.primaryLight)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(Color.primaryLightActive, lineWidth: 0.33)
            }
            .onTapGesture {
                withAnimation(.bouncy) {
                    isDatePickerVisible.toggle()
                }
            }
    }
}

