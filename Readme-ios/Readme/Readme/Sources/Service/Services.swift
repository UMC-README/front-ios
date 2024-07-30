//
//  Services.swift
//  Readme
//
//  Created by Subeen on 7/21/24.
//

import Foundation

protocol ServiceType {
    var authService: AuthenticationServiceType { get set }
    var userService: UserServiceType { get set }
    var adminService: AdminServiceType { get set }
    var photoPickerService: PhotoPickerServiceType { get set }
}

class Services: ServiceType {
    var authService: AuthenticationServiceType
    var userService: UserServiceType
    var adminService: AdminServiceType
    var photoPickerService: PhotoPickerServiceType
    
    init() {
        self.authService = AuthenticationService()
        self.userService = UserService()
        self.adminService = AdminService()
        self.photoPickerService = PhotoPickerService()
    }
}

// 프리뷰용 서비스
class StubServices: ServiceType {
    var authService: AuthenticationServiceType = StubAuthenticationService()
    var userService: UserServiceType = StubUserService()
    var adminService: AdminServiceType = StubAdminService()
    var photoPickerService: PhotoPickerServiceType = StubPhotoPickerService()
}
