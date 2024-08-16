//
//  NotCompleteView.swift
//  Readme
//
//  Created by Subeen on 8/17/24.
//

import SwiftUI

struct NotCompleteView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 80) {
                Spacer()
                    .frame(height: 100)
                Text("오답입니다.")
                    .font(.pretendardBold28)
                    .foregroundStyle(Color.txtDefault)
                Text("❌")
                    .font(.system(size: 100))
                Spacer()
                Button {
                    
                } label: {
                    Text("메인으로")
                }
                .buttonStyle(ConfirmButtonStyle(buttonType: .blue))
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    NotCompleteView()
}
