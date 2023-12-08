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
                    title: { Text("Panggilan") },
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
                    title: { Text("Komunitas") },
                    icon: { Image(systemName: "person.3") }
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
                    title: { Text("Chat") },
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
                    title: { Text("Pengaturan") },
                    icon: { Image(systemName: "gear") }
                )
            }
        }.ignoresSafeArea()
        

    }
}

#Preview {
    ContentView()
}
