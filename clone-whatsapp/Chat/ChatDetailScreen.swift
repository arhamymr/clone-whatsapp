//
//  ChatDetailScreen.swift
//  clone-whatsapp
//
//  Created by arham on 09/12/23.
//

import SwiftUI
import SwiftData


enum ChatMessageDirection {
    case left
    case right
}

struct ChatBubleItem: View {
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



struct ChatDetailScreen: View {
    
    @Environment(\.modelContext) var modalContext;
    
    @Query var chats: [ChatBubleItemModel]
    
    @State private  var messageText = ""
    
    private func sendMessage() {
        let newMessage = ChatBubleItemModel(message: messageText, read: false, user: "me" )
        self.messageText = ""
        modalContext.insert(newMessage)
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let answerMessage = ChatBubleItemModel(message: "What ?", read: false, user: "kaidan")
            modalContext.insert(answerMessage)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(){
                    Spacer()
                    ForEach (chats) { chat in
                        HStack {
                            ChatBubleItem(message: chat.message, direction: chat.user == "me" ? .right : .left, read: chat.read, user: chat.user)
                        }
                    }
                }
              
                
                .padding()
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
                                TextField("", text: $messageText, onCommit: sendMessage)
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
        .modelContainer(for: ChatBubleItemModel.self)
    
}
