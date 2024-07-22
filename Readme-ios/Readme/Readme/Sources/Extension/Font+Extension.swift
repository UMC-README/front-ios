//
//  Font.swift
//  Readme
//
//  Created by Subeen on 7/21/24.
//

import SwiftUI

extension Font {
    
    // Bold
    static let pretenardBold18: Font = .custom("Pretendard-Bold", size: 18)
    
    // Medium
    static let pretenardMedium16: Font = .custom("Pretendard-Medium", size: 16)
    
    // Regular
    static let pretendardRegular12: Font = .custom("Pretendard-Regular", size: 12)
    
}


/// 폰트가 추가되었는지 확인
func checkFontFile() {
    for fontFamily in UIFont.familyNames {
        for fontName in UIFont.fontNames(forFamilyName: fontFamily) {
            print(fontName)
        }
    }
}

/// 프레임을 폰트 높이에 맞추기
func heightForFontSize(size: CGFloat) -> CGFloat {
    let font = UIFont.systemFont(ofSize: size)
    return font.capHeight
}
