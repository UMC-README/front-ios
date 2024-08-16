//
//  CompleteView.swift
//  Readme
//
//  Created by Subeen on 8/17/24.
//

import SwiftUI

struct CompleteView: View {
    
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
                    Button {
                        goToMain()
                    } label: {
                        Text("메인으로")
                    }
                    .buttonStyle(ConfirmButtonStyle(buttonType: .blue))
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

