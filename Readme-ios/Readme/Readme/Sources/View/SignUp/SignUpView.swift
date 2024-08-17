//
//  SignupView.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI


struct SignUpView: View {
    
    @EnvironmentObject var authViewModel: AuthenticationViewModel
    @State var process: Int = 1 // 1 - 4
//    @State var currentPage: SignUpQuestionType = .name
    
    @State var name: String = ""
    @State var nickname: String = ""
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationStack {
            
            VStack(alignment: .leading) {
                processView
                
                VStack {
                    Spacer()
                        .frame(height: 60)
                    questionView
                    Spacer()
                    buttonView
                }
                .padding(.horizontal, 16)
            }
            .navigationTitle("회원가입")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    var questionView: some View {
        VStack(alignment: .leading, spacing: 30) {
            let current: SignUpQuestionType = authViewModel.signInQuestions[process - 1]
            
            Text(current.question.first!)
                .foregroundStyle(Color.txtDefault)
                .font(.pretendardBold24)
            
            switch current {
            case .name:
                VStack {
                    TextField(
                        "",
                        text: $name,
                        prompt: Text("정답을 입력하세요.")
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
                    buttonView
                }
            case .nickname:
                Text("name")
            case .email:
                Text("name")
            case .password:
                Text("name")
            }
            
//            Text(authViewModel.signInQuestions[self.process].question)
//                .foregroundStyle(Color.txtDefault)
//                .font(.pretendardBold24)
        }
    }
    
    var buttonView: some View {
        Button {
            
        } label: {
            Text("다음")
        }
        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        .buttonStyle(DefaultButtonStyle(buttonType: .blue))
    }
    
    var processView: some View {
        GeometryReader { proxy in
            ZStack {
                Rectangle()
                    .frame(height: 4)
                HStack {
                    Rectangle()
                        .frame(width: (proxy.size.width / 4.0) * CGFloat(process), height: 4)
                        .foregroundStyle(Color.primaryNormal)
                        .animation(.bouncy, value: process)
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
