//
//  VideoRow.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/4.
//

import SwiftUI

struct Video {
    let name: String
    let year: String
    let time: String
    let creator: String
    let maturityNum: String
    let about: String
    let Netflix: String
    let YouTube: String
    let photoLink: [String]
}

struct VideoRow: View {
    let video: Video
    @State private var rotateDegree: Double = 0
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: video.photoLink[0])) { image in
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
                .frame(height: 195)
                .cornerRadius(20)
            }
            .cornerRadius(20)
            .shadow(radius: 10)
            .padding(.top, 15)
            
            Text(video.name)
                .font(.title)
                .bold()
            
            Text(video.year + "・" + video.maturityNum + "・" + video.time)
                .padding(.bottom, 5)
        }
    }
}
