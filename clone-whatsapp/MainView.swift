//
//  ContentView.swift
//  clone-whatsapp
//
//  Created by arham on 06/12/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .tabItem {
                Label(
                    title: { Text("Status") },
                    icon: { Image(systemName: "circle.dashed.inset.filled") }
                )
            }

            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .tabItem {
                Label(
                    title: { Text("Calls") },
                    icon: { Image(systemName: "phone") }
                )
            }
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .tabItem {
                Label(
                    title: { Text("Communities") },
                    icon: { Image(systemName: "person.3") }
                )
            }
            
            ChatScreen()
            .tabItem {
                Label(
                    title: { Text("Chats") },
                    icon: { Image(systemName: "message") }
                )
            }
            
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
            .tabItem {
                Label(
                    title: { Text("Settings") },
                    icon: { Image(systemName: "gear") }
                )
            }
        }.ignoresSafeArea()
        

    }
}

#Preview {
    ContentView()
}
