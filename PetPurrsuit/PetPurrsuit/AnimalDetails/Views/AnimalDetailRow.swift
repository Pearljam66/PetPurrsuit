//
//  AnimalDetailRow.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct AnimalDetailRow: View {
    let animal: AnimalEntity

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                AnimalDetailCard(
                    title: "Age",
                    value: animal.age.rawValue,
                    color: animal.age.color
                )

                AnimalDetailCard(
                    title: "Gender",
                    value: animal.gender.rawValue,
                    color: .pink
                )

                AnimalDetailCard(
                    title: "Size",
                    value: animal.size.rawValue,
                    color: .mint
                )

                AnimalDetailCard(
                    title: "Coat",
                    value: animal.coat.rawValue,
                    color: .brown
                )
            }
            .padding(.horizontal)
        }
    }
}

struct AnimalDetailCards_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            AnimalDetailRow(animal: animal)
                .previewLayout(.sizeThatFits)
        }
    }
}
