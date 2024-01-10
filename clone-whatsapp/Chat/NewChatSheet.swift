//
//  NewChatSheet.swift
//  clone-whatsapp
//
//  Created by arham on 09/12/23.
//

import SwiftUI


struct NewChatSheet: View {
    @Binding var toggle: Bool
    @StateObject var contactModel = GetContact()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        NewChatItem(image: Image(systemName: "person.2.fill"), label: "New Group")
                        NewChatItem(image: Image(systemName: "person.fill.badge.plus"), label: "New Contact")
                        NewChatItem(image: Image(systemName: "person.3.fill"), label: "New Community")
                        NewChatItem(image: Image(systemName: "megaphone.fill"), label: "New Broadcast")
                    }
                    
                    Section (header: Text("Discover").font(.subheadline).fontWeight(.bold).textCase(.none)){
                        NewChatItem(image: Image(systemName: "person.2.fill"), label: "Businesses")
                    }
                    
                    Section (header: Text("Frequently Contacted").font(.subheadline).fontWeight(.bold).textCase(.none)){
                        NewChatAvatar(image: "avatar1", name: "Kaiden", bio: "eloctro user")
                        NewChatAvatar(image: "avatar4", name: "newko", bio: "yuhuuu")
                    }
                    
                    Section (header: Text("Contacts on Whatsapp").font(.subheadline).fontWeight(.bold).textCase(.none)){
                        NewChatAvatar(image: "avatar1", name: "Arham (yourself)", bio: "seven")
                    }
                    
                    Section(header: Text("Contacts")) {
                        ForEach(contactModel.contacts) { contact in
                            HStack {
                                Avatar(name: contact.firstName, size: .sm)
                                Text(contact.firstName)
                            }
                           
                        }
                    }
                }
            }.onAppear {
                contactModel.requestContactAccess()
            }
            .navigationBarTitle("New Chat", displayMode: .inline)
            .navigationBarItems(trailing:
                Button {
                   toggle.toggle()
                } label: {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.gray)
                }
            )
            
        }
        
    }
}

