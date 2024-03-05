//
//  AnimalsNearByView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

struct AnimalsNearByView: View {
    @State var animals: [AnimalEntity] = []
    @State var isLoading = true
    private let networkRequestManager = NetworkRequestManager()

    var body: some View {
        NavigationView {
            List {
                ForEach(animals) { animal in
                    AnimalRowView(animal: animal)
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
        if let animals = CoreDataHelper.getTestAnimalEntities() {
            AnimalsNearByView(animals: animals, isLoading: false)
        }
    }
}
