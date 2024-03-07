//
//  AnimalsNearYouViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import SwiftUI

@MainActor
final class AnimalsNearYouViewModel: ObservableObject {
    @Published var hasMoreAnimals = true
    @Published var isLoading: Bool
    private let animalFetcher: AnimalsFetcher
    private let animalStore: AnimalStore
    private(set) var page = 1

    init(isLoading: Bool = true, animalFetcher: AnimalsFetcher, animalStore: AnimalStore) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
        self.animalStore = animalStore
    }

    func fetchAnimals() async {
        let animals = await animalFetcher.fetchAnimals(page: page)
        do {
            try await animalStore.save(animals: animals)
        } catch {
            print("Error storing animals \(error.localizedDescription)")
        }
        isLoading = false
        hasMoreAnimals = !animals.isEmpty
    }

    func fetchMoreAnimals() async {
        page += 1
        await fetchAnimals()
    }

}
