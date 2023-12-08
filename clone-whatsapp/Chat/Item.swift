//
//  ChatItem.swift
//  clone-whatsapp
//
//  Created by arham on 08/12/23.
//

import SwiftUI

struct ChatItem: View {
    var avatar: String
    var name: String
    var preview: String
    var time: String
    
    func convertToTime(date: String) -> String {
        let utcFormatter = ISO8601DateFormatter()
        guard let convertedDate = utcFormatter.date(from: date) else { return "invalid date" }
        
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "HH:mm"
        return dateFormater.string(from: convertedDate)
    }
    
    var body: some View {
        HStack{
            HStack{
                Avatar(image: avatar)
                VStack(alignment:.leading){
                    HStack {
                        Text(name).fontWeight(.bold)
                        Spacer()
                        Text(convertToTime(date: time))
                            .foregroundColor(.secondary)
                    }
                    Text(preview)
                        .lineLimit(2)
                        .truncationMode(.tail)
                        .foregroundColor(.secondary)
                }
                
            }
        }
    }
}

#Preview {
    ChatItem(avatar: "avatar1",name: "Chapter DPE",preview: "latest message here lates messag",time: "2023-12-06T17:03:19Z")
}
