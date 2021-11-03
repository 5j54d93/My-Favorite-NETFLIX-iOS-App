//
//  PhotoView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/4.
//

import SwiftUI

struct PhotoView: View {
    let video: Video
    @State private var rotateDegree: Double = 0
    var body: some View {
        TabView {
            ForEach(2..<video.photoLink.count) { epsode in
                VStack {
                    AsyncImage(url: URL(string: video.photoLink[epsode])) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ZStack {
                            Color.gray
                            Image(systemName: "rays")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .rotationEffect(.degrees(rotateDegree))
                                .animation(
                                    .linear(duration: 3.5)
                                        .repeatForever(autoreverses: false),
                                    value: rotateDegree
                                )
                                .onAppear{
                                    rotateDegree = 360
                                }
                        }
                    }
                    .frame(height: 240)
                    
                    Text("第 \(epsode-1)／\(video.photoLink.count-2) 集")
                        .padding(.top)
                }
            }
        }
        .tabViewStyle(.page)
        .navigationTitle("Photos")
    }
}
