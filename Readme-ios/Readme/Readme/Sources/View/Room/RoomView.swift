//
//  RoomView.swift
//  Readme
//
//  Created by Subeen on 7/25/24.
//

import SwiftUI

struct RoomView: View {
    
    @EnvironmentObject var container: DIContainer
    @StateObject var roomViewModel: RoomViewModel
    

    var body: some View {
//        NavigationStack {
            ZStack {
                ScrollView {
                    VStack {
                        Text("roomId : \(roomViewModel.roomId ?? 45)")
                        noticeListView
                            .task {
                                await roomViewModel.getAllPosts()
                            }
                        
                    }
                    .padding(.horizontal, 16)
                    
                }
                adminButtonView
            }
//        }
    }
    
    /// 공지글 미리보기 목록
    @ViewBuilder
    var noticeListView: some View {
        let _ = print("공지글 미리보기 목록 뷰 형성!!!!!!!!")
//        let _ = print(
        VStack {
            ForEach(roomViewModel.postLiteResponse?.result?.data ?? []) { post in
                PostPreviewView(post: post)
                let _ = print("\(post)")
            }
        }
    }
    
    var adminButtonView: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button {
                    roomViewModel.isPresentedPostEditView.toggle()
                    print("공지글 작성 페이지 이동 버튼 누름")
                } label: {
                    Circle()
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("글")
                                .foregroundStyle(Color.basicWhite)
                        }
                }
                .sheet(isPresented: $roomViewModel.isPresentedPostEditView) {
                    CreatePostView(roomViewModel: roomViewModel, roomID: roomViewModel.roomId)
                }
            }
            .padding(.bottom, 16)
        }
        .padding(.trailing, 16)
    }
}

//Button {
//    viewModel.isPresentedDescEditView.toggle()
//} label: {
//    Text(viewModel.userInfo?.description ?? "상태메시지를 입력해주세요.")
//        .font(.system(size: 14))
//        .foregroundColor(.bgWh)
//}
//.sheet(isPresented: $viewModel.isPresentedDescEditView) {
//    MyProfileDescEditView(description: viewModel.userInfo?.description ?? "") {
//        willBeDesc in
//        /// 완료 버튼을 누르면 해당 클로저 실행 (DB의 값 업데이트)
//        Task {
//            await viewModel.updateDescription(willBeDesc)
//        }
//    }
//}

struct RoomView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        RoomView(roomViewModel: .init(container: container, roomId: 45))
            .environmentObject(container)
    }
}
