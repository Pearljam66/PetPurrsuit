//
//  AnimalDetailMainView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import SwiftUI

struct AnimalDetailMainView: View {
    @State var zoomed = false
    @State var favorited = false

    let animal: AnimalEntity

    var animalDescription: String? {
        animal.animalDescription
    }

    var animalName: String? {
        animal.name
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack(alignment: .leading) {
                    LazyVStack(alignment: .leading) {
                        AnimalHeaderView(animal: animal, zoomed: $zoomed, favorited: $favorited, geometry: geometry)
                            .onTapGesture { zoomed.toggle() }
                        Divider()
                            .blur(radius: zoomed ? 20 : 0)
                        PetRankingView(animal: animal)
                            .padding()
                            .blur(radius: zoomed ? 20 : 0)
                        AnimalDetailRow(animal: animal)
                            .blur(radius: zoomed ? 20 : 0)
                        Divider()
                            .blur(radius: zoomed ? 20 : 0)
                        VStack(alignment: .leading, spacing: 24) {
                            if let description = animalDescription {
                                VStack(alignment: .leading) {
                                    Text("Details")
                                        .font(Font.custom("Roboto-Medium", size: 18, relativeTo: .headline))
                                    Text(description)
                                }
                            }
                            AnimalContactsView(animal: animal)
                            Divider()
                                .blur(radius: zoomed ? 20 : 0)
                            AnimalLocationView(animal: animal)
                        }
                        .blur(radius: zoomed ? 20 : 0)
                        .padding(.horizontal)
                        .padding(.bottom)
                    }
                    .animation(.spring(), value: zoomed)
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.petlightgreen, .white]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)

            )
        }
        .navigationTitle(animalName ?? "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AnimalsView_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            NavigationView {
                AnimalDetailMainView(animal: animal)
                    .previewLayout(.sizeThatFits)
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("iPhone SE (2nd generation)")

            NavigationView {
                AnimalDetailMainView(animal: animal)
            }
            .previewDevice("iPhone 12 Pro")
            .previewDisplayName("iPhone 12 Pro")
        }
    }
}
