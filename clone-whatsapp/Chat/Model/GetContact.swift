//
//  File.swift
//  clone-whatsapp
//
//  Created by arham on 09/12/23.
//

import SwiftUI
import Contacts


struct ContactInfo: Identifiable {
    let id: UUID
    let firstName: String
    let lastName: String
    let emails: [String]
}

class GetContact: ObservableObject {
    @Published var contacts : [ContactInfo] = []
    
    func requestContactAccess() {
            let store = CNContactStore()
            store.requestAccess(for: .contacts) { (granted, error) in
                if granted {
                    self.loadContacts()
                } else {
                    print("Access to contacts denied.")
                }
            }
        }

    private func loadContacts() {
            let store = CNContactStore()
            let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactEmailAddressesKey]

            let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])
        
            DispatchQueue.global(qos: .background).async {
                do {
                    try store.enumerateContacts(with: request) { (contact, _) in
                        let firstName = contact.givenName
                        let lastName = contact.familyName
                        let emails = contact.emailAddresses.map { $0.value as String }
                        print(contact)

                        let newContact = ContactInfo(id: UUID(), firstName: firstName, lastName: lastName, emails: emails)
                        
                        DispatchQueue.main.async {
                            self.contacts.append(newContact)
                        }
                    }
                } catch {
                    print("Error loading contacts: \(error)")
                }
            }
            
        }

}
