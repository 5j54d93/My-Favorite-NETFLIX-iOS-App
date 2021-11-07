//
//  ExternalLinkView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/7.
//

import SwiftUI

struct ExternalLinkView: View {
    let video: Video
    var body: some View {
        Group {
            Divider()
                .padding(.top, 5)
            
            HStack {
                Label("外部連結", systemImage: "network")
                    .foregroundColor(.gray)
                Spacer()
            }
            
            HStack {
                Link(destination: URL(string: video.Netflix)!, label: {
                    ZStack {
                        Image("Netflix0")
                            .resizable()
                            .scaledToFill()
                        
                        Image(systemName: "arrow.up.right.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .offset(x: 70, y: -70)
                            .opacity(0.85)
                    }
                })
                .shadow(radius: 20)
                
                Link(destination: URL(string: video.YouTube)!, label: {
                    ZStack {
                        Image("YouTube")
                            .resizable()
                            .scaledToFill()
                        
                        Image(systemName: "arrow.up.right.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                            .offset(x: 70, y: -70)
                            .opacity(0.85)
                    }
                })
                .shadow(radius: 10)
            }
        }
        .padding(.horizontal)
    }
}

