//
//  CreatePostView.swift
//  Readme
//
//  Created by Subeen on 8/8/24.
//

import SwiftUI
import PhotosUI

struct CreatePostView: View {
    @EnvironmentObject var container: DIContainer
    @ObservedObject var roomViewModel: RoomViewModel
    var roomID: Int?
//    var onCompleted: (PostRequest) -> Void
    
    let types: [PostType] = [.quiz, .mission]
    @State var type: PostType = .quiz
    
    @State var title: String = ""
    @State var content: String = ""
    
    @State var selectedImages = [PhotosPickerItem]()
    @State var images = [UIImage]()
    
    @State var startDate: Date? = nil
    @State var endDate: Date? = nil
//    @State var endDate: Date = Date()
    @State var isStartDateVisible = false
    @State var isEndDateVisible = false
    
    
    @State var quizOrMission: String = ""
    @State var answer: String = ""

    
    @State var isCompleted: Bool = false
    
    let maxPhotosToSelect = 10
    
    var body: some View {
        ZStack {
            Color.backgroundLight.ignoresSafeArea(.all)
//            GeometryReader { geometry in
                ScrollView {
                    VStack(alignment: .leading) {
                        typeSelectionView
                        postContentView
                        imageUploadView
                        infoView
                        sendButtonView
                    }
                .padding(.horizontal, 16)

            }
        }
    }
    
    @ViewBuilder
    var typeSelectionView: some View {
        HStack {
            ForEach(0..<self.types.count, id: \.self) { index in
                Button {
                    type = types[index]
                } label: {
                    if type == types[index] {
                        Text(types[index].description)
                            .font(.pretendardBold16)
                            .foregroundStyle(Color.primaryNormal)
                    } else {
                        Text(types[index].description)
                            .font(.pretendardMedium16)
                            .foregroundStyle(Color.txtDefault)
                    }
                }
                .disabled((type == types[index]))
            }
            
        }
    }
    
    @ViewBuilder
    var postContentView: some View {
        
        VStack {
            TextField("제목을 입력하세요.", text: $title)
                .foregroundStyle(Color.basicWhite)
                .font(.pretendardBold18)
                .padding(.vertical, 12)
                .padding(.horizontal, 18)
                .background(Color.primaryNormal)
            
            TextEditor(text: $content)
                .scrollContentBackground(.hidden)
                .foregroundStyle(Color.txtDefault)
                .padding(.horizontal, 12)

                .background(Color.backgroundLight)
        }
        
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .frame(minHeight: 300, maxHeight: .infinity)
        
        .overlay{
            RoundedRectangle(cornerRadius: 8)
                
                .strokeBorder(lineWidth: 0.5)
                .foregroundStyle(Color.primaryNormal)
        }
        .background(Color.backgroundLight)
        
    }
    
    @ViewBuilder
    var imageUploadView: some View {
        VStack(alignment: .leading) {
            Text("사진 (\(self.images.count) / 10)")
                .font(.pretendardBold16)
                .foregroundStyle(Color.txtDefault)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.fixed(100))]) {
                    PhotosPicker(
                        selection: $selectedImages,
                        maxSelectionCount: maxPhotosToSelect,
                        matching: .images,
                        photoLibrary: .shared()
                    ) { // 이미지 선택 버튼
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.primaryNormal, lineWidth: 1)
                            .frame(width: 100, height: 100)
                            .overlay {
                                Image(systemName: "plus")
                                    .padding(.bottom, 10)
                                    .padding(.trailing, 10)
                            }
                        
                    
                    }
                    
                    ForEach(0..<self.images.count, id: \.self) { index in
                        Image(uiImage: self.images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
            }
            .onChange(of: self.selectedImages) { _, _ in
                self.convertDataToImage()
            }
        }
    }
    
    @MainActor
    func convertDataToImage() {
//        images.removeAll()
        
        if !selectedImages.isEmpty {
            for item in selectedImages {
                Task {
                    if let imageData = try? await item.loadTransferable(type: Data.self) {
                        if let image = UIImage(data: imageData) {
                            images.append(image)
                        }
                    }
                }
            }
        }
        selectedImages.removeAll()
    }
    
    @ViewBuilder
    var infoView: some View {
        VStack {
            HStack {
                Text("시작 날짜")
                    .frame(width: 76, alignment: .leading)
                    .foregroundStyle(Color.txtDefault)
                    .font(.pretendardBold16)
                
                Text(startDate.map { DateFormatter.customFormatter.string(from: $0) } ?? "yyyy.mm.dd HH:mm")
                    .foregroundStyle((startDate != nil) ? Color.txtDefault : Color.txtEmpty)
                    .font(.pretendardMedium16)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryLight)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.primaryLightActive, lineWidth: 0.33)
                    }
                .overlay(alignment: .top) {
                    DatePicker("", selection: Binding(get: { startDate ?? Date() },set: { self.startDate = $0 }), displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                        .colorMultiply(.clear)       // <<< here
//                        .scaleEffect(isStartDateVisible ? 1 : 0)
                }
            }
            HStack {
                Text("마감 날짜")
                    .frame(width: 76, alignment: .leading)
                    .foregroundStyle(Color.txtDefault)
                    .font(.pretendardBold16)
                
                Text(endDate.map { DateFormatter.customFormatter.string(from: $0) } ?? "yyyy.mm.dd HH:mm")
                    .foregroundStyle((startDate != nil) ? Color.txtDefault : Color.txtEmpty)
                    .font(.pretendardMedium16)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryLight)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .strokeBorder(Color.primaryLightActive, lineWidth: 0.33)
                    }
                .overlay(alignment: .top) {
                    DatePicker("", selection: Binding(get: { startDate ?? Date() },set: { self.startDate = $0 }), displayedComponents: [.date, .hourAndMinute])
                        .labelsHidden()
                        .colorMultiply(.clear)       // <<< here
//                        .scaleEffect(isStartDateVisible ? 1 : 0)
                }
            }
            HStack {
                Text("퀴즈")
                    .frame(width: 76, alignment: .leading)
                    .foregroundStyle(Color.txtDefault)
                    .font(.pretendardBold16)
                
                TextField(
                    "",
                    text: $quizOrMission,
                    prompt: Text("퀴즈를 입력하세요.")
                )
                .textFieldStyle(SmallTextFieldStyle())
            }
            
            if type == .quiz {
                HStack {
                    Text("정답")
                        .frame(width: 76, alignment: .leading)
                        .foregroundStyle(Color.txtDefault)
                        .font(.pretendardBold16)
                    
                    TextField(
                        "",
                        text: $answer,
                        prompt: Text("정답을 입력하세요.")
                    )
                    .textFieldStyle(SmallTextFieldStyle())
                }
            }
        }
    }
    
    @ViewBuilder
    var sendButtonView: some View {
        Button {
                // Date를 String으로 변환
                let startDateString = startDate != nil ? DateFormatter.customFormatter.string(from: startDate!) : ""
                let endDateString = endDate != nil ? DateFormatter.customFormatter.string(from: endDate!) : ""
            
            print(endDateString)
            
            let roomID = roomViewModel.roomId

                // PostRequest 객체 생성
            let request = roomViewModel.makePostRequest(
                    roomID: roomID,
                    type: type.rawValue,
                    title: title,
                    content: content,
                    startDate: startDateString,
                    endDate: endDateString,
                    question: question,
                    quizAnswer: answer,
                    imgURLs: []
                )
                print("공지글 작성 request \(request)")
                // 서버로 요청 보내기
                Task {
                    print("공지글 생성!!!!!!!!!!")
                    isCompleted = await roomViewModel.createPost(postRequest: request)
                }
            } label: {
                Text("공지글 생성")
                    .font(.pretendardBold16)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primaryNormal)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
            }
            .padding(.top, 16)
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        CreatePostView(roomViewModel: .init(container: container, roomId: 45))
            .environmentObject(container)
    }
}
