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
                List {
                    HStack {
                        Spacer()
                        VStack {
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
                                    .padding(.vertical, 15)
                                    .transition(.opacity)
                                }
                                .animation(.default, value: show)
                            } else {
                                Color.gray
                                    .frame(width: 150, height: 150)
                                    .clipShape(Circle())
                                    .padding(.vertical, 15)
                                    .hidden()
                            }
                            
                            Button(show ? "Hide Ricky Chuang" : "Show App Author") {
                                show.toggle()
                            }
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .padding(.bottom, 15)
                            .animation(.default, value: show)
                        }
                        Spacer()
                    }
                    
                    Section {
                        Link(destination: URL(string: "https://linktr.ee/5j_54d93")!, label: {
                            Label("Linktree", systemImage: "arrow.up.right.square")
                                    .font(.title2)
                        })
                    } header: {
                        Label("社群連結", systemImage: "network")
                    }
                    Section {
                        Button(action: {
                            UIApplication.shared.setAlternateIconName(nil)
                            appIcon0 = "circle.inset.filled"
                            appIcon1 = "circle"
                            appIcon2 = "circle"
                        }) {
                            HStack {
                                Image("Netflix0")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(24)
                                    .padding(.vertical, 10)
                                    .transition(.opacity)
                                Text("Current")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Spacer()
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
                            HStack {
                                Image("Netflix1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(24)
                                    .padding(.vertical, 10)
                                    .transition(.opacity)
                                Text("Classic")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Spacer()
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
                            HStack {
                                Image("Netflix2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(24)
                                    .padding(.vertical, 10)
                                    .transition(.opacity)
                                Text("Old School")
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                Spacer()
                                Image(systemName: appIcon2)
                                    .padding(.top, 5)
                            }
                        }
                    } header: {
                        Label("App Icon", systemImage: "questionmark.app")
                    }
                }.navigationTitle("App Author")
            }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
