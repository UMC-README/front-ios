//
//  NavigationDestination.swift
//  Readme
//
//  Created by Subeen on 7/21/24.
//

import Foundation

enum NavigationDestination: Hashable {
    case signUp
    case mypage
    case penalty
    case submit
    case room(roomId: Int)
    case createRoom(userId: Int)
    case post(postId: Int)
}
