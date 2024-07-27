//
//  SignInIntroView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

struct SignInIntroView: View {
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
            
            VStack(spacing: 10) {
                Spacer()
                
                signinView
                
                Spacer()
                
                signinButtonView
                
                Spacer()
                    .frame(height: 123)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
        }
    }
    
    @ViewBuilder
    var signinView: some View {
        TextField(
            "",
            text: $email,
            prompt: Text("이메일")
        )
        .textFieldStyle(DefaultTextFieldStyle())
        
        
        TextField(
            "",
            text: $password,
            prompt: Text("비밀번호")
        )
        .maxLength(text: $password, 20)
        .textFieldStyle(DefaultTextFieldStyle())
        .overlay {
            HStack {
                Spacer()
                Text("(\(password.count)/\(20))")
                    .font(.pretendardRegular12)
                    .foregroundStyle(Color.txtCaption)
                    .padding(.trailing, 18)
            }
        }
    }
    
    @ViewBuilder
    var signinButtonView: some View {
        Button {
            Task {
                await authViewModel.signinWithEmail()
            }
        } label: {
            Text("로그인")
        }.buttonStyle(DefaultButtonStyle(buttonType: .blue))
        
        Button {
            
        } label: {
            Text("회원가입")
        }.buttonStyle(DefaultButtonStyle(buttonType: .white))
    }
}

#Preview {
    SignInIntroView()
        .environmentObject(AuthenticationViewModel(container: .init(services: StubServices())))
}
