//
//  ContentView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AnimeView()
                .tabItem {
                    Label("Anime", systemImage: "paintbrush.pointed.fill")
                }
            SeriesView()
                .tabItem {
                    Label("Series", systemImage: "film")
                }
            AboutView()
                .tabItem {
                    Label("About", systemImage: "person.circle.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
