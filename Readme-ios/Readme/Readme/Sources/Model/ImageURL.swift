//
//  ImageURL.swift
//  Readme
//
//  Created by Subeen on 7/30/24.
//

import Foundation

struct ImageURL: Identifiable, Codable {
    var id = UUID().uuidString
    var status: Int?
    var isSuccess: Bool?
    var code: Int?
    var message: String?
    var result: String?
}

extension ImageURL {
    static let stub01: ImageURL = .init(id: "1", status: 200, isSuccess: true, code: 200, message: "stub message", result: "https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyNDAxMjZfMjAy%2FMDAxNzA2MjMyNTI3MTg5.8krMTziOarlj-CnenQ00oQ9ggDXlvCemzgpjosTKtEcg.Cf9DU5N_esefZlf5rv6CEABBEpw9VCLMsSdcTGYSAeAg.JPEG.qeenmakerr%2FIMG_4900.JPG&type=sc960_832")
}
