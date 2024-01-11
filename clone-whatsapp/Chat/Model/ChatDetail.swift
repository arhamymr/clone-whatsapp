//
//  ChatDetailData.swift
//  clone-whatsapp
//
//  Created by arham on 11/01/24.
//

import Foundation
import SwiftData

@Model
class ChatBubleItemModel : Identifiable {
    var id: String;
    var message: String
    var read: Bool
    var user: String
    
    
    init(message: String, read: Bool, user: String){
        self.id = UUID().uuidString
        self.message = message
        self.read = read
        self.user = user
    }
}
