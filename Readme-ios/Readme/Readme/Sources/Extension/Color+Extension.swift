//
//  Color+Extension.swift
//  Readme
//
//  Created by Subeen on 7/22/24.
//

import SwiftUI

//enum ColorType {
//    
//    enum Basic: Color {
//        case black = Color(hex: "000000")
//    }
//    case basic
//    case background
//    case gray
//    case system
//    case primary
//    
//    
//}
//
//enum basicType {
//    case black
//}


extension Color {

    // basic
    static let basicBlack = Color(hex: "000000")
    static let basicWhite = Color(hex: "FFFFFF")
    
    // background
    static let backgroundLight = Color(hex: "FFFFFF")
    static let backgroundDimmed60 = Color(hex: "222222").opacity(60)
    
    // grayscale
    static let gray1 = Color(hex: "F3F3F3")
    static let gray2 = Color(hex: "E9E9E9")
    static let gray3 = Color(hex: "DDDDDD")
    static let gray4 = Color(hex: "BDBDBD")
    static let gray5 = Color(hex: "888888")
    static let gray6 = Color(hex: "444444")
    static let gray7 = Color(hex: "222222")
    
    // system
    static let successLight = Color(hex: "E3F2EF")
    static let success = Color(hex: "00A881")
    static let warningLight = Color(hex: "FEE9D7")
    static let warning = Color(hex: "F57D14")
    static let dangerLight = Color(hex: "F5535E")
    static let danger = Color(hex: "F5535E")
    
    // primary
    static let dark = Color(hex: "0f00bf")
    static let normal = Color(hex: "0011ff")
    static let lightActive = Color(hex: "b0b5ff")
    static let light = Color(hex: "e6e7ff")
    
    // text
    static let txtDefault = Color(hex: "222222")
    static let txtCaption = Color(hex: "888888")
    static let txtDisabled = Color(hex: "BDBDBD")
    static let txtEmpty = Color(hex: "BDBDBD")
    

}

public extension Color {

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >>  8) & 0xFF) / 255.0
        let b = Double((rgb >>  0) & 0xFF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
