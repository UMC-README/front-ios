//
//  RequestCheckViewModel.swift
//  Readme
//
//  Created by Subeen on 8/16/24.
//

import Foundation


@Observable
class SubmitViewModel: ObservableObject {
    
    enum Action {
        case goToComplete
        case goToNotComplete
        case goToPending
        
        case goToRoomMain
        case goToPost
    }

    var submitResponse: SubmitResponse?
    var submitRequest: SubmitRequest?
    var submitAfterResponse: SubmitAfterResponse?
    var submitModelDestination: SubmitModelDestination?
    
    var post: PostLite?
    var postId: Int     /// path에 사용
    var roomName: String
    
    
    private var container: DIContainer
    
    init(container: DIContainer, postId: Int, roomName: String) {
        self.container = container
        self.postId = postId
        self.roomName = roomName
    }
    
}

extension SubmitViewModel {
    
    func send(action: Action) {
        switch action {
        case .goToComplete:
            self.submitModelDestination = .compete
        case .goToNotComplete:
            self.submitModelDestination = .notComplete
        case .goToPending:
            self.submitModelDestination = .pending
            
        case .goToRoomMain:
            container.navigationRouter.popPages(num: 2)
            
        case .goToPost:
            container.navigationRouter.pop()
        }
    }
    
    func load() async {
        do {
            let response = try await container.services.roomService.getSubmitRequirement(postId: postId)
            submitResponse = response
        } catch {
            submitResponse = .submitResponseStub01
            Log.network("Submit VM - load() 에러", error)
        }
    }
    
    /// 제출 request 모델 생성
    func createSubmitRequest(content: String, imageURLs: [String]) {
        self.submitRequest = .init(content: content, imageURLs: imageURLs)
        
    }
    
    /// 정답 제출
    func createSubmit() async -> SubmitStateType? {
        print("Submit VM createSubmit()")
        if let submitRequest = submitRequest {
            do {
                submitAfterResponse = try await self.container.services.roomService.postSubmitRequirement(postId: postId, submitRequest: submitRequest)
                print("createSubmit() 정답 제출 성공")
                
                let submitState = submitAfterResponse?.result?.submitState
                
                if submitState == .complete {
                    print("퀴즈 정답!")
                    return .complete
                } else if submitState == .pending {
                    print("미션 대기 중!")
                    return .pending
                } else {
                    print("퀴즈 오답!")
                    return .notComplete
                }
                
            } catch {
                print("createSubmit() 정답 제출 실패")
                return nil
            }
        }
        print("submitRequest 생성 실패")
        return nil
    }
    
    /// 퀴즈 - 정답
    
    
    
    /// 퀴즈 - 오답


    
    /// 미션 - 전송완료
    
    
    
}
