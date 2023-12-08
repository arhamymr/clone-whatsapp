//
//  ChatScreen.swift
//  clone-whatsapp
//
//  Created by arham on 08/12/23.
//

import SwiftUI

struct ChatScreen: View {
    var body: some View {
        List {
            ChatItem(avatar: "avatar1", name: "Chapter DPE", preview: "Hellow ini adalah applikasi chat pertama", time:"2023-12-06T17:03:19Z")
        }
    }
}

#Preview {
    ChatScreen()
}
