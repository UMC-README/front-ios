//
//  SignupView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI


struct SignUpView: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
  
    @State var name: String = ""
    @State var nickname: String = ""
    @State var email: String = ""
    @State var code: String = ""
    @State var isSentCode: Bool = false
    @State var isEmailValid: Bool = false
    
    @State var password: String = ""
    
    @State var isCompletedSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.backgroundLight.ignoresSafeArea(.all)
                
                VStack(alignment: .leading) {
                    processView
                    
                    VStack {
                        Spacer()
                            .frame(height: 60)
                        questionView
                    }
                    .padding(.horizontal, 16)
                }
                .navigationTitle("회원가입")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden()
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        backButton
                    }
                }
            }
        }
    }
    
    var backButton: some View {
        Button {
            if authViewModel.signUpCurrentPage == 1 {
                print("회원가입 -> 로그인")
                authViewModel.send(action: .goToSigninMain)
            } else {
                if authViewModel.signUpCurrentPage > 1 {
                    authViewModel.signUpCurrentPage -= 1
                }
            }
        } label: {
            Text("<")
        }
    }
    
    var questionView: some View {
        VStack(alignment: .leading, spacing: 30) {
            let current: SignUpQuestionType = authViewModel.signInQuestions[authViewModel.signUpCurrentPage - 1]
            
            Text(current.question.first!)
                .foregroundStyle(Color.txtDefault)
                .font(.pretendardBold24)
            
            switch current {
            case .name:
                nameView
            case .nickname:
                nicknameView
            case .email:
                emailView
            case .password:
                passwordView
            }
        }
    }
    
    var nameView: some View {
        VStack {
            TextField(
                "",
                text: $name,
                prompt: Text("입력하세요.")
            )
            .maxLength(text: $name, 20)
            .textFieldStyle(DefaultTextFieldStyle())
            .overlay {
                HStack {
                    Spacer()
                    Text("(\(name.count)/\(20))")
                        .font(.pretendardRegular12)
                        .foregroundStyle(Color.txtCaption)
                        .padding(.trailing, 18)
                }
            }
            
            Spacer()
            
            Button {
                authViewModel.signUpCurrentPage = 2
            } label: {
                Text("다음")
            }
            .disabled(name.isEmpty)
            .buttonStyle(DefaultButtonStyle(buttonType: .blue))
        }
    }
    
    var nicknameView: some View {
        VStack {
            TextField(
                "",
                text: $nickname,
                prompt: Text("정답을 입력하세요.")
            )
            .maxLength(text: $nickname, 20)
            .textFieldStyle(DefaultTextFieldStyle())
            .overlay {
                HStack {
                    Spacer()
                    Text("(\(nickname.count)/\(20))")
                        .font(.pretendardRegular12)
                        .foregroundStyle(Color.txtCaption)
                        .padding(.trailing, 18)
                }
            }
            
            Spacer()
            
            Button {
                authViewModel.signUpCurrentPage = 3
            } label: {
                Text("다음")
            }
            .disabled(name.isEmpty)
            .buttonStyle(DefaultButtonStyle(buttonType: .blue))
        }
    }
    
    var emailView: some View {
        VStack(alignment: .leading) {
            HStack {    // 이메일 인증
                TextField(
                    "",
                    text: $email,
                    prompt: Text("입력하세요.")
                )
                .textFieldStyle(DefaultTextFieldStyle())
                
                
                Button { // TODO: - 이메일 인증 코드 생성 후, 성공하면 인증하기 버튼 비활성화
                    Task {
                        isSentCode = await authViewModel.createCode(email: email)
                    }
                } label: {
                    Text("인증하기")
                }
                .disabled(email.isEmpty)
                .buttonStyle(SmallButtonStyle(buttonType: .blue))
                
            }
            
            Spacer()
                .frame(height: 40)
            
            Text("인증코드를 입력해주세요.")
                .foregroundStyle(Color.txtDefault)
                .font(.pretendardBold24)
            
            Spacer()
                .frame(height: 30)
            
            HStack {    // 코드 입력
                TextField(
                    "",
                    text: $code,
                    prompt: Text("입력하세요.")
                )
                .disabled(!isSentCode)
                .textFieldStyle(DefaultTextFieldStyle())
                
                Button {
                    Task {
                        isEmailValid = await authViewModel.confirmCode(email: email, code: code)
                    }
                     
                } label: {
                    Text("확인")
                }
                .disabled(code.isEmpty)
                .buttonStyle(SmallButtonStyle(buttonType: .blue))
                
            }
            
            Spacer()
            
            Button { // TODO: email 유효성 검사후 true일 경우 하단의 다음버튼 활성화
                authViewModel.signUpCurrentPage = 4
            } label: {
                Text("다음")
            }
            .disabled(!isEmailValid)
            .buttonStyle(DefaultButtonStyle(buttonType: .blue))
        }
    }
    
    var passwordView: some View {
        VStack {
            TextField(
                "",
                text: $password,
                prompt: Text("입력하세요.")
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
            
            Spacer()
            
            Button {
                authViewModel.createAuthRequest(name: name, nickname: nickname, email: email, password: password)
                Task {
                    
                    
                    isCompletedSignUp = await authViewModel.signUpWithEmail()
                }
            } label: {
                Text("회원가입 하기")
            }
            .disabled(password.isEmpty)
            .buttonStyle(DefaultButtonStyle(buttonType: .blue))
        }
    }
    
    var processView: some View {
        GeometryReader { proxy in
            ZStack {
                Rectangle()
                    .frame(height: 4)
                HStack {
                    Rectangle()
                        .frame(width: (proxy.size.width / 4.0) * CGFloat(authViewModel.signUpCurrentPage), height: 4)
                        .foregroundStyle(Color.primaryNormal)
                        .animation(.bouncy, value: authViewModel.signUpCurrentPage)
                    Spacer()
                }
            }
        }
        .frame(height: 4)
    }
    
//    func textFieldView()
}

struct SignUpView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthenticationViewModel(container: container))
    }
}
