//
//  RequestCheckViewModel.swift
//  Readme
//
//  Created by Subeen on 8/16/24.
//

import Foundation


@Observable
class SubmitViewModel: ObservableObject {

    var submitResponse: SubmitResponse?
    var submitRequest: SubmitRequest?
    var submitAfterResponse: SubmitAfterResponse?
    
    var post: PostLite?
    var postId: Int     /// path에 사용
    
    
    private var container: DIContainer
    
    init(container: DIContainer, postId: Int) {
        self.container = container
        self.postId = postId
    }
    
}

extension SubmitViewModel {
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
    func createSubmit() async -> Bool {
        print("Submit VM createSubmit()")
        if let submitRequest = submitRequest {
            do {
                submitAfterResponse = try await self.container.services.roomService.postSubmitRequirement(postId: postId, submitRequest: submitRequest)
                print("createSubmit() 정답 제출 성공")
                return true
            } catch {
                print("createSubmit() 정답 제출 실패")
                return false
            }
        }
        print("submitRequest 생성 실패")
        return false
    }
}
