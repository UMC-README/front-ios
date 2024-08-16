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
                Color.backgroundLight.ignoresSafeArea()
                ScrollView {
                    VStack {
                        Text("roomId : \(roomViewModel.roomId )")
                        noticeListView
                            
                            .task {
                                await roomViewModel.getAllPosts()
                            }
                        
                    }
                    .refreshable {
                        await roomViewModel.getAllPosts()
                    }
                    .fullScreenCover(item: $roomViewModel.roomModelDestination) {
                        switch $0 {
                        case .roomSetting:
                            Text("공지방 수정 삭제")
                        case .memberList:
                            Text("멤버 목록")
                        case .submitList:
                            Text("확인 요청 내역")
                        case .createPost:
                            CreatePostView(roomViewModel: roomViewModel, roomID: roomViewModel.roomId)
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
            ForEach(roomViewModel.postLiteResponse?.result?.posts ?? []) { post in
                PostPreviewView(post: post)
                    .onTapGesture {
                        print("\(post.postID)번 게시글 클릭")
                        if let postId = post.postID, let isRoomAdmin = roomViewModel.postLiteResponse?.result?.isRoomAdmin!  {
                            roomViewModel.send(action: .goToPost(postId: postId, isRoomAdmin: isRoomAdmin, roomName: roomViewModel.roomName))
                        } else {
                            print("postId, isRoomAdmin을 찾을 수 없습니다.")
                        }
                        
                    }
            }
        }
    }
    
    var adminButtonView: some View {
        HStack {
            Spacer()
            VStack {
                Spacer()
                Button {
//                    roomViewModel.isPresentedPostEditView.toggle()
                    roomViewModel.roomModelDestination = .createPost
                    print("공지글 작성 페이지 이동 버튼 누름")
                } label: {
                    Circle()
                        .frame(width: 100, height: 100)
                        .overlay {
                            Text("글")
                                .foregroundStyle(Color.basicWhite)
                        }
                }
//                .fullScreenCover(isPresented: $roomViewModel.isPresentedPostEditView) {
//                    CreatePostView(roomViewModel: roomViewModel, roomID: roomViewModel.roomId)
//                }
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
        RoomView(roomViewModel: .init(container: container, roomId: 45, roomName: "공지방 이름"))
            .environmentObject(container)
    }
}
