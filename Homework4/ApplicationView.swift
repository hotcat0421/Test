//
//  ApplicationView.swift
//  test
//
//  Created by 서지완 on 7/8/24.
//

import SwiftUI

struct ApplicationView: View {
    @State var title: String = ""
    @State var content: String = ""
    @ObservedObject var viewModel = PostViewModel()
    var body: some View {
        NavigationView {
            VStack {
                TextField("제목을 입력해주세요", text: $title)
                    .padding(.leading, 35)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 350,height: 50)
                            .foregroundStyle(.yellow)
                    )
                
                TextField("내용을 입력해주세요", text: $content)
                    .padding(.leading, 35)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 350,height: 50)
                            .foregroundStyle(.yellow)
                    )
                    .padding(.top, 30)
                Spacer()
                
                Button {
                    viewModel.SubmitPost(title: title, content: content)
                }label: {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30,height: 30)
                }
                
            }
            .navigationTitle("게시물 업로드")
            .padding(.top, 20)
        }
    }
}

#Preview {
    ApplicationView()
}
