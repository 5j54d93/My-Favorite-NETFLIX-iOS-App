//
//  MusicSectionView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/7.
//

import SwiftUI
import AVFoundation

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
