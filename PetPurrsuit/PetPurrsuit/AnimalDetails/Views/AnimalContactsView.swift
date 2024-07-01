//
//  AnimalContactsView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct AnimalContactsView: View {
    let animal: AnimalEntity

    init(animal: AnimalEntity) {
        self.animal = animal
    }

    var phoneNumber: String? {
        animal.contactInfo?.phone
    }

    var emailAddress: String? {
        animal.contactInfo?.email
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text("Contact:")
                .font(.headline)
                .fontWeight(.bold)
            HStack {
                if let phoneLink = animal.phoneLink, let phoneNumber = phoneNumber {
                    AnimalContactLink(
                        title: phoneNumber,
                        iconName: "phone.fill",
                        url: phoneLink,
                        color: .petmediumblue
                    )
                }
                if let emailLink = animal.emailLink, let emailAddress = emailAddress {
                    AnimalContactLink(
                        title: emailAddress,
                        iconName: "envelope.fill",
                        url: emailLink,
                        color: .petmaroon
                    )
                }
            }
        }
    }
}

#Preview {
    if let animal = CoreDataHelper.getTestAnimalEntity() {
        AnimalContactsView(animal: animal)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
