//
//  AnimalsNearByView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

struct AnimalsNearByView: View {
    @SectionedFetchRequest<String, AnimalEntity>(
        sectionIdentifier: \AnimalEntity.animalSpecies,
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.species, ascending: true),
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    )
    private var sectionedAnimals: SectionedFetchResults<String, AnimalEntity>
    @State var isLoading = true
    private let networkRequestManager = RequestManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(sectionedAnimals) { animals in
                    Section(header: Text(animals.id)) {
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailsView()) {
                                AnimalRowView(animal: animal)
                            }
                        }
                    }
                }
            }
            .task {
                await fetchAnimals()
            }
            .listStyle(.plain)
            .navigationTitle("Animals near by")
            .overlay {
                if isLoading {
                    ProgressView("Finding animals near you")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    func fetchAnimals() async {
        do {
            let animalsContainer: AnimalContainer = try await networkRequestManager.perform(
                AnimalsRequest.getAnimalsWith(page: 1, latitude: nil, longitude: nil))
            for var animal in animalsContainer.animals {
                animal.convertToManagedCoreObject()
            }
            await stopLoading()
        } catch {
            print("Error fetching animals...\(error)")
        }
    }

    @MainActor
    func stopLoading() async {
        isLoading = false
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearByView(isLoading: false)
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
