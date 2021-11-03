//
//  AnimeDetailView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/3.
//

import SwiftUI
import AVFoundation

struct AnimeDetailView: View {
    let video: Video
    var body: some View {
        ScrollView(.vertical) {
            TopPhotoView(video: video)
            
            Text(video.year + "・" + video.maturityNum + "・" + video.time)
            
            InfoView(video: video)
            
            MusicSectionView(video: video)
            
            ExternalLinkView(video: video)
                .padding(.bottom, 5)
        }
        .navigationTitle(video.name)
    }
}

struct TopPhotoView: View {
    let video: Video
    @State private var rotateDegree: Double = 0
    var body: some View {
        TabView {
            ForEach(0..<2) { item in
                AsyncImage(url: URL(string: video.photoLink[item])) { image in
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
                            .onDisappear {
                                rotateDegree = 0
                            }
                    }
                }
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
        .tabViewStyle(.page)
        .frame(height: 225)
    }
}

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

struct MusicSectionView: View {
    let video: Video
    let player = AVPlayer()
    @State private var play = false
    @State private var showMusicInfo = false
    @State private var time = 0
    @State private var timer: Timer?
    @State private var volume: Float = 0.5
    var body: some View {
        Group {
            HStack {
                Label("Music", systemImage: "music.note")
                    .foregroundColor(.gray)
                
                if showMusicInfo {
                    Text("：at \(time) seconds｜Volume \(String(format: "%.1f", volume))")
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .onAppear {
                let fileUrl = Bundle.main.url(forResource: video.name, withExtension: "mp3")!
                let Item = AVPlayerItem(url: fileUrl)
                self.player.replaceCurrentItem(with: Item)
            }
            
            HStack {
                Button {
                    showMusicInfo = true
                    if time < 10 {
                        time = 0
                    } else {
                        time -= 10
                    }
                    player.seek(to: CMTime(value: CMTimeValue(time), timescale: 1))
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: 80)
                        Image(systemName: "gobackward.10")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
                
                Button {
                    play.toggle()
                    if play {
                        player.play()
                        showMusicInfo = true
                        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                            time += 1
                        }
                    } else {
                        player.pause()
                        self.timer?.invalidate()
                    }
                } label: {
                    ZStack {
                        Capsule()
                        if play {
                            Label("Stop", systemImage: "pause.fill")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                        } else {
                            Label("Play", systemImage: "play.fill")
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding(.vertical, 10)
                        }
                    }
                }
                
                Button {
                    showMusicInfo = true
                    time += 10
                    player.seek(to: CMTime(value: CMTimeValue(time), timescale: 1))
                } label: {
                    ZStack {
                        Capsule()
                            .frame(width: 80)
                        Image(systemName: "goforward.10")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25)
                    }
                }
            }
            
            Button {
                player.pause()
                play.toggle()
                self.timer?.invalidate()
                player.seek(to: .zero)
                time = 0
                player.volume = 0.5
                volume = player.volume
            } label: {
                ZStack {
                    Capsule()
                    Label("Reset", systemImage: "stop.fill")
                        .font(.title3)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                }
            }
            
            HStack {
                Button {
                    showMusicInfo = true
                    if player.volume > 0.1 {
                        player.volume -= 0.1
                        volume = player.volume
                    } else {
                        player.volume = 0
                        volume = player.volume
                    }
                } label: {
                    ZStack {
                        Capsule()
                        Label("降低音量", systemImage: "speaker.wave.1.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                    }
                }
                
                Button {
                    showMusicInfo = true
                    if player.volume < 1 {
                        player.volume += 0.1
                        volume = player.volume
                    } else {
                        player.volume = 1
                        volume = player.volume
                    }
                } label: {
                    ZStack {
                        Capsule()
                        Label("增加音量", systemImage: "speaker.wave.3.fill")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                    }
                }
            }
        }
        .padding(.horizontal)
    }
}

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
