//
//  RoomModelDestination.swift
//  Readme
//
//  Created by Subeen on 8/10/24.
//

import Foundation

/// 운영진용 공지방 화면 전환
enum RoomModelDestination: Hashable, Identifiable {
    case roomSetting    /// 공지방 수정, 삭제
    case memberList     /// 공지방 멤버 목록
    case requestHistoryList    /// 확인 요청 내역
    case createPost     /// 공지글 작성
    
    var id: Int {
        hashValue
    }
}
