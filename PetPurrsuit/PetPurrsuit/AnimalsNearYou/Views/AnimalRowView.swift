//
//  AnimalRowView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import SwiftUI

struct AnimalRowView: View {
    let animal: AnimalEntity

    var body: some View {
        HStack {
            AsyncImage(url: animal.picture) { image in
                image
                    .resizable()
            } placeholder: {
                Image("MyOctocat")
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
            }
            .lineLimit(1)
        }
    }
}

struct AnimalRowView_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            AnimalRowView(animal: animal)
        } else {
            Text("No animal data available")
        }
    }
}
