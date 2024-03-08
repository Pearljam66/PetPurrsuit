//
//  AnimalSearchViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

import SwiftUI

final class AnimalSearchViewModel: ObservableObject {
    @Published var searchText = ""
    private let animalSearcher: AnimalSearcher
    private let animalStore: AnimalStore

    init(animalSearcher: AnimalSearcher, animalStore: AnimalStore) {
        self.animalSearcher = animalSearcher
        self.animalStore = animalStore
    }

    var shouldFilter: Bool {
        !searchText.isEmpty
    }

    func search() {
        Task {
            let animals = await animalSearcher.searchAnimal(by: searchText, age: .none, type: .none)

            do {
                try await animalStore.save(animals: animals)
            } catch {
                print("Error storing animals... \(error.localizedDescription)")
            }
        }
    }
}
