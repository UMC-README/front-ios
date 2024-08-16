//
//  BaseTargetType.swift
//  Readme
//
//  Created by Subeen on 7/26/24.
//

import Foundation
import Moya

public protocol BaseTargetType: TargetType {}


extension BaseTargetType {
    public var baseURL: URL {
        return URL(string: BaseAPI.base.apiDesc)!
    }
    
    public var headers: [String : String]? {
        return APIConstants.baseHeader
    }
    
}
