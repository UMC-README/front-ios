//
//  RequestCheckView.swift
//  Readme
//
//  Created by Subeen on 8/16/24.
//

import SwiftUI

struct SubmitView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var container: DIContainer
    @StateObject var submitViewModel: SubmitViewModel
    
    @State var images: [String]? = []
    
    @State var answer: String = ""
    
    @State var submitResult: SubmitStateType? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundLight.ignoresSafeArea(.all)
                ScrollView {
                    VStack(spacing: 40) {
                        questionView
                        
                        switch submitViewModel.submitResponse?.result?.type {
                        case .mission:
                            Text("mission")
                        case .quiz:
                            answerView
                        case .none:
                            Text("None")
                        }
                    
                        Spacer()
                        
                        sendButtonView
                    }
                    .fullScreenCover(item: $submitViewModel.submitModelDestination) {
                        switch $0 {
                        case .compete:
                            CompleteView {
                                
                                submitViewModel.send(action: .goToRoomMain)
                            } rereadPost: {
                                submitViewModel.send(action: .goToPost)
                            }

                        case .notComplete:
                            NotCompleteView {
                                
                                submitViewModel.send(action: .goToRoomMain)
                            } rereadPost: {
                                submitViewModel.send(action: .goToPost)
                            }
                        case .pending:
                            PendingView{
                                
                                submitViewModel.send(action: .goToRoomMain)
                            } rereadPost: {
                                submitViewModel.send(action: .goToPost)
                            }
                        }
                        
                    }
                    .padding(.horizontal, 16)
                }
            }
            .navigationTitle(submitViewModel.roomName)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await submitViewModel.load()
                
            }
        }
    }
    
    var questionView: some View {
        LazyVStack(alignment: .leading) {
            Text("Q.")
            Text(submitViewModel.submitResponse?.result?.question ?? "")
                .multilineTextAlignment(.leading)
        }
        .foregroundStyle(Color.txtDefault)
        .font(.pretendardBold28)
    }
    
    var answerView: some View {
        VStack(alignment: .leading) {
            Text("A.")
                .foregroundStyle(Color.primaryNormal)
                .font(.pretendardBold28)
            TextField(
                "",
                text: $answer,
                prompt: Text("정답을 입력하세요.")
            )
            .maxLength(text: $answer, 20)
            .textFieldStyle(DefaultTextFieldStyle())
            .overlay {
                HStack {
                    Spacer()
                    Text("(\(answer.count)/\(20))")
                        .font(.pretendardRegular12)
                        .foregroundStyle(Color.txtCaption)
                        .padding(.trailing, 18)
                }
            }
        }
    }
    
    var sendButtonView: some View {
        Button {
            submitViewModel.createSubmitRequest(content: answer, imageURLs: images!)
            
            Task {
                let status = await submitViewModel.createSubmit()
                
                print("\(status) ⭐️⭐️⭐️⭐️")
                
                switch status {
                case .complete:
                    submitViewModel.send(action: .goToComplete)
                case .pending:
                    submitViewModel.send(action: .goToPending)
                case .reject:
                    Text("reject")
                case .notComplete:
                    submitViewModel.send(action: .goToNotComplete)

                case .none:
                    Text("None")
                }

            }
        } label: {
            Text("제출")
        }
        .disabled(answer.isEmpty)
        .buttonStyle(ConfirmButtonStyle(buttonType: .blue))
    }
}

struct SubmitView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        SubmitView(submitViewModel: .init(container: container, postId: 1, roomName: "공지방 이름"))
    }
}

