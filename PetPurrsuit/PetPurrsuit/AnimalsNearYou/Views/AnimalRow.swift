//
//  AnimalRow.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import SwiftUI

struct AnimalRow: View {
    let animal: AnimalEntity
    var animalName: String
    var animalType: String
    var animalDescription: String

    var animalBreedAndType: String {
        "\(animal.breed) \(animalType)"
    }

    init(animal: AnimalEntity) {
        self.animal = animal
        animalName = animal.name ?? ""
        animalType = animal.type ?? ""
        animalDescription = animal.animalDescription ?? ""
    }

    var body: some View {
            HStack {
                AsyncImage(url: animal.picture) { image in
                    image
                        .resizable()
                        .accessibilityLabel("Image of Pet")
                } placeholder: {
                    Image("NoImage")
                        .resizable()
                        .accessibilityLabel("Placeholder Logo")
                        .overlay {
                            if animal.picture != nil {
                                ProgressView()
                                    .accessibilityLabel("Image loading indicator")
                                    .accessibilityHidden(true)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .background(.gray.opacity(0.4))
                            }
                        }
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 112, height: 112)
                .cornerRadius(8)

                    VStack(alignment: .leading) {
                        Text(animalName)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("Roboto-Medium", size: 18, relativeTo: .title3))
                            .accessibilityLabel(animalName)
                        Text(animalBreedAndType)
                            .font(Font.custom("Roboto-Medium", size: 15, relativeTo: .callout))
                            .accessibilityLabel(animalBreedAndType)
                            .accessibilityHidden(true)
                        if let description = animal.animalDescription {
                            Text(description)
                                .lineLimit(2)
                                .font(Font.custom("Roboto-Medium", size: 12, relativeTo: .footnote))
                                .accessibilityLabel(description)
                                .accessibilityHidden(true)
                        }

                        HStack {
                            Text(animal.age.rawValue)
                                .modifier(AnimalAttributesCard(color: animal.age.color))
                                .accessibilityLabel(animal.age.rawValue)
                                .accessibilityHidden(true)
                            Text(animal.gender.rawValue)
                                .modifier(AnimalAttributesCard(color: .pink))
                                .accessibilityLabel(animal.gender.rawValue)
                        }
                    }
        }
    }
}

struct AnimalRow_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            AnimalRow(animal: animal)
        }
    }
}
