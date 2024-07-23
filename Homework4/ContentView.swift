//
//  ContentView.swift
//  test
//
//  Created by 서지완 on 7/8/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 350,height: 80)
                    .foregroundStyle(.gray)
                    .overlay(
                        HStack {
                            VStack (alignment: .leading){
                                Text("title")
                                    .font(.system(size: 25)).bold()
                                Text("내용내용내용내용")
                                    .opacity(0.8)
                            }
                            Spacer()
                        }
                        .padding(.leading, 20)
                    )
                    .padding(.top, 20)
                
                Spacer()
                HStack {
                    Button {
                        
                    }label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30,height: 30)
                    }
                    
                    Button {
                        
                    }label: {
                        Image(systemName: "trash")
                            .resizable()
                            .frame(width: 30,height: 30)
                            .foregroundStyle(.red)
                    }
                }
                
            }
            .navigationTitle("게시판")
        }
    }
}

#Preview {
    ContentView()
}
