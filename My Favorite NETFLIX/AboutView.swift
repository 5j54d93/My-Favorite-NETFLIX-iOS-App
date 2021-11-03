//
//  AboutView.swift
//  My Favorite NETFLIX
//
//  Created by 莊智凱 on 2021/11/4.
//

import SwiftUI

struct AboutView: View {
    @State private var show = false
    @State private var rotateDegree: Double = 0
    @State private var appIcon0 : String = "circle.inset.filled"
    @State private var appIcon1 : String = "circle"
    @State private var appIcon2 : String = "circle"
    var body: some View {
        NavigationView {
            ScrollView {
                if show {
                    Group {
                        AsyncImage(url: URL(string: "https://scontent.ftpe5-1.fna.fbcdn.net/v/t1.6435-9/243510986_4346965502091743_8018565325561027515_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=2DaVvoSQIE8AX-euUo4&_nc_ht=scontent.ftpe5-1.fna&oh=7c566004540c2739a44146a70e2f10ba&oe=61A32275")) { image in
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
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                        .padding(.top, 30)
                        .transition(.opacity)
                    }
                    .animation(.default, value: show)
                } else {
                    Color.gray
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .padding(.top, 30)
                        .hidden()
                }
                
                Button(show ? "Hide Ricky Chuang" : "Show App Author") {
                    show.toggle()
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .padding(.vertical, 20)
                .animation(.default, value: show)
                
                Group {
                    HStack {
                        Label("社群連結", systemImage: "network")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    Link(destination: URL(string: "https://linktr.ee/5j_54d93")!, label: {
                        ZStack {
                            Rectangle()
                                .fill(LinearGradient(gradient: Gradient(colors: [Color(red: 65/256, green: 228/256, blue: 167/256),Color(red: 44/256, green: 199/256, blue: 133/256)]), startPoint: .leading, endPoint: .trailing))
                            
                            Label("Linktree", systemImage: "arrow.up.right.square")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(.vertical, 8)
                        }
                    })
                    
                    HStack {
                        Label("App Icon", systemImage: "questionmark.app")
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    HStack {
                        Button(action: {
                            UIApplication.shared.setAlternateIconName(nil)
                            appIcon0 = "circle.inset.filled"
                            appIcon1 = "circle"
                            appIcon2 = "circle"
                        }) {
                            VStack {
                                Image("Netflix0")
                                    .resizable()
                                    .scaledToFill()
                                    .transition(.opacity)
                                Image(systemName: appIcon0)
                                    .padding(.top, 5)
                            }
                        }
                        Button(action: {
                            UIApplication.shared.setAlternateIconName("Netflix1")
                            appIcon0 = "circle"
                            appIcon1 = "circle.inset.filled"
                            appIcon2 = "circle"
                        }) {
                            VStack {
                                Image("Netflix1")
                                    .resizable()
                                    .scaledToFill()
                                    .transition(.opacity)
                                Image(systemName: appIcon1)
                                    .padding(.top, 5)
                            }
                        }
                        Button(action: {
                            UIApplication.shared.setAlternateIconName("Netflix2")
                            appIcon0 = "circle"
                            appIcon1 = "circle"
                            appIcon2 = "circle.inset.filled"
                        }) {
                            VStack {
                                Image("Netflix2")
                                    .resizable()
                                    .scaledToFill()
                                    .transition(.opacity)
                                Image(systemName: appIcon2)
                                    .padding(.top, 5)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("App Author")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
