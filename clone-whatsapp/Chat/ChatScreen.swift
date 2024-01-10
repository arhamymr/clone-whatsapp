//
//  ChatScreen.swift
//  clone-whatsapp
//
//  Created by arham on 08/12/23.
//

import SwiftUI

struct ChatItemData: Hashable {
    var avatar: String
    var name: String
    var preview: String
    var time: String
    var read: Bool
}

struct ChatScreen: View {
    @State private var search = ""
    @State private var newChatSheetShow = false
    @State private var title = "Chats"
    
    let chatData: [ChatItemData] = [
        ChatItemData(avatar: "avatar1", name: "Kaiden", preview: "Hey, how's it going?", time: "2023-12-07T10:30:00Z", read: true),
        ChatItemData(avatar: "avatar2", name: "Jinwo", preview: "Meeting went well. Let's catch up later.", time: "2023-12-07T11:45:00Z", read: false),
        ChatItemData(avatar: "avatar3", name: "Sophia", preview: "Did you see the latest movie? It's amazing!", time: "2023-12-07T12:15:00Z", read: false),
        ChatItemData(avatar: "avatar4", name: "Kartein ✨", preview: "Check out the new updates on our project.", time: "2023-12-07T13:30:00Z", read: false),
        ChatItemData(avatar: "avatar5", name: "Ethan", preview: "Don't forget the deadline is approaching!", time: "2023-12-07T15:00:00Z", read: true),
        ChatItemData(avatar: "avatar6", name: "Cat2", preview: "Any plans for the weekend?", time: "2023-12-07T16:45:00Z", read: false),
        ChatItemData(avatar: "avatar7", name: "Lily", preview: "Let's grab lunch tomorrow.", time: "2023-12-08T12:00:00Z", read: false),
        ChatItemData(avatar: "avatar8", name: "Oliver", preview: "Just finished a great book. I recommend it!", time: "2023-12-08T14:30:00Z", read: true),
        ChatItemData(avatar: "avatar9", name: "Emma", preview: "Happy birthday! 🎉", time: "2023-12-09T08:00:00Z", read: false),
        ChatItemData(avatar: "avatar10", name: "Noah", preview: "Exciting news! Let's celebrate tonight.", time: "2023-12-09T16:15:00Z", read: false),
        // ... add more items as needed
    ]
    var body: some View {
        
        NavigationStack {
            List {
                HStack(spacing:20) {
                    TextField("Search", text: $search)
                        .padding(10)
                        .textFieldStyle(.plain)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(10)
                        
                    Image(systemName: "line.3.horizontal.decrease")
                        .foregroundColor(.blue)
                        .padding(.trailing, 10)
                }
                
                ForEach(chatData, id: \.self) { item in
                    NavigationLink(
                        destination: ChatDetailScreen()
                            .onAppear {
                                title = "30"
                            }
                            .onDisappear {
                                title = "Chats"
                            }.toolbar(.hidden, for: .tabBar)
                        ,
                        label: {
                            ChatItem(avatar: item.avatar, name: item.name, preview: item.preview, time:item.time, read: item.read)
                               
                            }
                        )
                }
               
            }
            .onAppear {
                title = "Chats"
            }
            .sheet(isPresented: $newChatSheetShow, content: {
                NewChatSheet(toggle: $newChatSheetShow)
            })
            .listStyle(.plain)
            .navigationBarTitle(title, displayMode: .automatic)
                .navigationBarItems(
                        leading: HStack {
                            Button(action: {
                                // Action for the left icon
//                                EditButton()
                            }) {
                                Image(systemName: "ellipsis.circle")
                            }
                        },
                        trailing: HStack {
                            Button(action: {
                                // Action for the right icon
//                                EditButton()
                            }) {
                                Image(systemName: "camera")
                            }
                            
                            Button(action: {
                                // Action for the right icon
                                newChatSheetShow.toggle()
                                
                            }) {
                                Circle()
                                    .fill(.blue)
                                    .frame(width: 25, height: 25)
                                    .overlay(
                                        Image(systemName: "plus")
                                            .foregroundColor(.white).font(.caption)
                                    )
                                
                            }
                        }
                    )
        }
       
    }
}

#Preview {
    ChatScreen()
}
