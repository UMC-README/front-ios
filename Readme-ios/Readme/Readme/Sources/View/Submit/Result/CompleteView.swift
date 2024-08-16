//
//  CompleteView.swift
//  Readme
//
//  Created by Subeen on 8/17/24.
//

import SwiftUI

struct CompleteView: View {
    @Environment(\.dismiss) var dismiss
    
    var goToMain: () -> ()
    var rereadPost: () -> ()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundLight.ignoresSafeArea(.all)
                VStack(spacing: 80) {
                    Spacer()
                        .frame(height: 100)
                    Text("정답입니다.")
                        .font(.pretendardBold28)
                        .foregroundStyle(Color.txtDefault)
                    Text("⭕️")
                        .font(.system(size: 100))
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Button {
                            dismiss()
                            goToMain()
                        } label: {
                            Text("메인으로")
                        }
                        .buttonStyle(DefaultButtonStyle(buttonType: .blue))
                        
                        Button {
                            dismiss()
                            rereadPost()
                        } label: {
                            Text("공지 다시 읽기")
                        }
                        .buttonStyle(DefaultButtonStyle(buttonType: .white))
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    CompleteView {
        
    } rereadPost: {
        
    }

}

