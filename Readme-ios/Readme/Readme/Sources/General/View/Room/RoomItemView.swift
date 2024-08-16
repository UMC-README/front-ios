 //
//  RoomItemView.swift
//  Readme
//
//  Created by Subeen on 7/23/24.
//

import SwiftUI

struct RoomItemView: View {
    
    var time: String
    var roomName: String
    var nickname: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text("\(time) 전")
                .padding(.vertical, 5)
                .padding(.horizontal, 7)
                .frame(maxWidth: .infinity)
                .background(Color.primaryNormal)
                .font(.pretendardRegular12)
                .foregroundStyle(Color.basicWhite)
            VStack(spacing: 6) {
                Rectangle()
                    .frame(width: 44, height: 44)
                Text(roomName)
                    .foregroundStyle(Color.primaryDark)
                    .font(.pretendardRegular14)
                    
                
                Text(nickname)
                    .foregroundStyle(Color.txtCaption)
                    .font(.pretendardRegular10)
                    
                
                }
            
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .lineSpacing(1)
                
                .padding(.top, 16)
                .padding(.horizontal, 8)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 160, alignment: .top)
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .strokeBorder(Color.primaryNormal, lineWidth: 0.33)
        }
    }
}

//#Preview {
//    RoomItemView()
//}

struct RoomItemView_Previews: PreviewProvider {
    static var previews: some View {
        RoomItemView(time: "30분", roomName: "공지방ddddddㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ 이름", nickname: "닉네ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ임")
            .previewLayout(.sizeThatFits)
    }
}
