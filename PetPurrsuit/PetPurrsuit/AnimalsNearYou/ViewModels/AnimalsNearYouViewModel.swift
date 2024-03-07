//
//  AnimalsNearYouViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import SwiftUI

@MainActor
final class AnimalsNearYouViewModel: ObservableObject {
    @Published var isLoading: Bool
    private let animalFetcher: AnimalsFetcher
    private let animalStore: AnimalStore

    init(isLoading: Bool = true, animalFetcher: AnimalsFetcher, animalStore: AnimalStore) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
        self.animalStore = animalStore
    }

    func fetchAnimals() async {
        let animals = await animalFetcher.fetchAnimals(page: 1)
        do {
            try await animalStore.save(animals: animals)
        } catch {
            print("Error storing animals \(error.localizedDescription)")
        }
        isLoading = false
    }

}
