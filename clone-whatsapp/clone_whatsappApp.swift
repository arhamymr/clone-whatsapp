//
//  clone_whatsappApp.swift
//  clone-whatsapp
//
//  Created by arham on 06/12/23.
//

import SwiftUI
import SwiftData

@main
struct clone_whatsappApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // pass swift data model context
        .modelContainer(for: ChatBubleItemModel.self)
    }
}
