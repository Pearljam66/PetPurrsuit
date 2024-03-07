//
//  AnimalRow.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import SwiftUI

struct AnimalRow: View {
    let animal: AnimalEntity

    var animalType: String {
        animal.type ?? ""
    }

    var animalBreedAndType: String {
        "\(animal.breed) \(animalType)"
    }

    var body: some View {
        HStack {
            AsyncImage(url: animal.picture) { image in
                image
                    .resizable()
            } placeholder: {
                Image("NoImage")
                    .resizable()
                    .overlay {
                        if animal.picture != nil {
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(.gray.opacity(0.4))
                        }
                    }
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 112, height: 112)
            .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(animal.name ?? "No animal name available")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                Text(animalBreedAndType)
                    .font(.callout)

                if let description = animal.animalDescription {
                    Text(description)
                        .lineLimit(2)
                        .font(.footnote)
                }

                HStack {
                    Text(animal.age.rawValue)
                        .padding(4)
                        .background(animal.age.color.opacity(0.2))
                        .cornerRadius(8)
                        .foregroundColor(animal.age.color)
                        .font(.subheadline)
                    Text(animal.gender.rawValue)
                        .padding(4)
                        .background(.pink.opacity(0.2))
                }
            }
            .lineLimit(1)
        }
    }
}

struct AnimalRowView_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            AnimalRow(animal: animal)
        } else {
            Text("No animal data available")
        }
    }
}
