//
//  InfoView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/7.
//

import SwiftUI

struct InfoView: View {
    let video: Video
    var body: some View {
        Group {
            HStack {
                Label("About", systemImage: "exclamationmark.circle")
                    .foregroundColor(.gray)
                    .padding(.vertical, 1)
                Spacer()
            }
            
            HStack {
                Text(video.about)
                Spacer()
            }
            
            Divider()
            
            HStack {
                Label("Creator", systemImage: "person.circle")
                    .foregroundColor(.gray)
                    .padding(.vertical, 1)
                Spacer()
            }
            
            HStack {
                Text(video.creator)
                Spacer()
            }
            
            Divider()
        }
        .padding(.horizontal)
    }
}
