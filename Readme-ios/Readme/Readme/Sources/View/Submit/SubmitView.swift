//
//  RequestCheckView.swift
//  Readme
//
//  Created by Subeen on 8/16/24.
//

import SwiftUI

struct SubmitView: View {
    
    @EnvironmentObject var container: DIContainer
    @StateObject var submitViewModel: SubmitViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundLight.ignoresSafeArea(.all)
                VStack {
                    Text(submitViewModel.submitResponse?.result?.question ?? "")
                        .foregroundStyle(Color.txtDefault)
                    
                }
            }
            .task {
                await submitViewModel.load()
                
            }
        }
    }
}

struct SubmitView_Previews: PreviewProvider {
    static let container: DIContainer = .stub
    
    static var previews: some View {
        SubmitView(submitViewModel: .init(container: container, postId: 1))
    }
}

