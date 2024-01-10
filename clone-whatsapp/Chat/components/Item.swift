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
    var read: Bool
    
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
                            Text(name).fontWeight(.semibold).foregroundColor(.primary)
                            Spacer()
                            Text(convertToTime(date: time))
                                .foregroundColor(.secondary)
                        }
                        HStack(alignment:.bottom, spacing: 3) {
                            Text(preview)
                                .lineLimit(2)
                                .truncationMode(.tail)
                                .foregroundColor(.secondary)
                                .multilineTextAlignment(.leading)
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(read ? .green : .gray)
                        }
                    }
                }
            }
            .swipeActions(edge:.leading) {
                Button {
                    
                } label: {
                    Label("unread message", systemImage: "message.badge")
                }.tint(.blue)
                
                Button {
                    
                } label: {
                    Label("attach", systemImage: "pin.fill")
                }.tint(.gray)
               
            }
            .swipeActions(edge:.trailing) {
                Button {
                    
                } label: {
                    Label("archive", systemImage: "archivebox")
                }.tint(.gray)
                
                Button {
                    
                } label: {
                    Label("other", systemImage: "ellipsis")
                }.tint(.blue)
                
                
            }
    }
}


struct NewChatItem: View  {
    var image: Image
    var label: String
    
    var body: some View {

        HStack(spacing: 12){
            Circle()
                .fill(.gray.opacity(0.2))
                .frame(width: 40, height: 40)
                .overlay(image.foregroundColor(.blue))
            Text(label)
                .foregroundColor(.blue)
        }
        
    }
}


struct NewChatAvatar: View {
    let image: String
    let name: String
    let bio: String
    
    var body: some View {
        HStack(spacing: 12){
            Avatar(image: image)
            VStack (alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                Text(bio)
                    .foregroundColor(.secondary)
            }
        }
    }
}
