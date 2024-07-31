//
//  ImageURL.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//

import Foundation

struct ImageURLResponse: Identifiable, Codable {
    let id = UUID().uuidString
    let isSuccess: Bool?
    let code: Int?
    let message: String?
    let result: ImageURLResult?
    
    struct ImageURLResult: Codable {
        let image: String?
    }
}

extension ImageURLResponse {
    static let stub01: ImageURLResponse = .init(isSuccess: true, code: 200, message: "stub message", result:  .init(image:"https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMjZfMjAy%2FMDAxNzA2MjMyNTI3MTg5.8krMTziOarlj-CnenQ00oQ9ggDXlvCemzgpjosTKtEcg.Cf9DU5N_esefZlf5rv6CEABBEpw9VCLMsSdcTGYSAeAg.JPEG.qeenmakerr%2FIMG_4900.JPG&type=sc960_832"))
}
