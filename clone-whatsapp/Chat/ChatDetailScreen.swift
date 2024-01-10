//
//  ChatDetailScreen.swift
//  clone-whatsapp
//
//  Created by arham on 09/12/23.
//

import SwiftUI

enum ChatMessageDirection {
    case left
    case right
}

struct ChatBubbleItem: View {
    
    let message: String
    let direction: ChatMessageDirection
    let read: Bool
    let user: String
    
    var body: some View {
        direction == .right ? Spacer() : nil
        HStack (){
            Text(message)
            user == "me" ? Image(systemName: "checkmark.circle.fill")
                .foregroundColor(read ? .green : .white) : nil
        }
        .padding()
        .background(.blue)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
        direction == .left ? Spacer() : nil
    }
}


struct ChatBubbleMessage: Hashable {
    let message: String
    let user: String
    let read: Bool
}

struct ChatDetailScreen: View {
    
    @State var chats = [
        ChatBubbleMessage(message: "Hellow", user: "me", read: true),
        ChatBubbleMessage(message: "How are you", user: "me", read: true),
        ChatBubbleMessage(message: "I'm fine bisakah kita pergi ke sana sekarang ", user: "kaiden", read: true),
        ChatBubbleMessage(message: "let go to the hills", user: "kaiden", read: true),
        ChatBubbleMessage(message: "oh now", user: "me", read: false),
        ChatBubbleMessage(message: "Hellow", user: "kaiden", read: false),
    ]
    
    @State private  var messageText = ""
    
    private func sendMessage() {
        let newMessage = ChatBubbleMessage(message: messageText, user: "me", read: false)
        print("send message")
        self.chats.append(newMessage)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(){
                    Spacer()
                    ForEach (chats, id: \.self) { chat in
                        HStack {
                            ChatBubbleItem(message: chat.message, direction: chat.user == "me" ? .right : .left, read: chat.read, user: chat.user)
                        }
                    }
                }.padding()
            
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                        leading: HStack {
                            Avatar(name: "kaiden", size: .sm)
                            VStack(alignment: .leading, spacing: 0){
                                Text("Kaiden").fontWeight(.semibold)
                                HStack(alignment:.center, spacing: 3) {
                                    Circle().fill(.green).frame(width: 10, height:10)
                                    Text("Online").foregroundColor(.secondary).font(.footnote)
                                }.padding(.bottom, 10)
                                
                            }
                        },
                        trailing: HStack(spacing: 12){
                            Button(action: {
                            }) {
                                Image(systemName: "video")
                            }
                            
                            Button(action: {

                            }) {
                                Image(systemName: "phone")
                            }
                        }
                    )
            }
            
            .toolbar {
            // Toolbar items go here
                ToolbarItem(placement: .bottomBar) {
                    VStack {
                        Divider()
                        HStack (spacing: 12){
                            Image(systemName: "plus").foregroundColor(.blue)
                            ZStack(alignment: .trailing){
                                Image(systemName: "doc").foregroundColor(.blue)
                                    .padding(.trailing, 10)
                                TextField("", text: $messageText)
                                    .padding(10)
                                    .background(.gray.opacity(0.1))
                                    .cornerRadius(20)
                            }
                            Image(systemName: "camera").foregroundColor(.blue)
                            Image(systemName: "mic").foregroundColor(.blue)
                        }
                        
                        .padding(.vertical, 8)
                    }
                }
            }
            
            
        }
        
    }
}

#Preview {
    ChatDetailScreen()
}
