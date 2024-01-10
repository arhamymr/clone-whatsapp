//
//  Avatar.swift
//  clone-whatsapp
//
//  Created by arham on 08/12/23.
//

import SwiftUI


enum AvatarSize: CGFloat {
    case sm = 40
    case md = 50
    case lg = 80
    
    var width: CGFloat {
        switch self {
        case .sm: return 40
        case .md:
            return 50
        case .lg:
            return 80
        }
    }
    
    var height: CGFloat {
        return width
    }
}

struct Avatar: View {
    let name: String?
    let image: String?
    let size: AvatarSize?
    
    private let width: CGFloat?
    private let height: CGFloat?
    
    init(name: String? = nil, image: String? = nil, size: AvatarSize = .md) {
        self.name = name
        self.image = image
        self.size = size
        self.height = size.height
        self.width = size.width
    }
    
    private func extractFirstTwoCharacters(input: String) -> String {
        return input
            .components(separatedBy: "")
            .compactMap { $0.first }
            .prefix(2)
            .map { String($0) }
            .joined()
    }

    
    var body: some View {
        Group {
            if let image = image {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .background(Color.gray)
                    .clipShape(Circle())
                    
            } else {
                Circle()
                    .fill(.blue)
                    .frame(width: width, height: height)
                    .overlay(
                        Group{
                            if let name = name {
                            Text(String(extractFirstTwoCharacters(input: name)))
                        } else {
                            Image(systemName: "person.fill")
                                .font(.system(size:25))
                            
                        }
                       
                    }.foregroundColor(.white))
            }
           
        }
        
    }
}

#Preview {
    Avatar(image: "avatar2")
}
