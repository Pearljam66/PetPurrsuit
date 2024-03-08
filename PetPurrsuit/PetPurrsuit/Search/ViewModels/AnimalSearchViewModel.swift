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
    @Published var ageSelection = AnimalSearchAge.none
    @Published var typeSelection = AnimalSearchType.none

    init(animalSearcher: AnimalSearcher, animalStore: AnimalStore) {
        self.animalSearcher = animalSearcher
        self.animalStore = animalStore
    }

    var shouldFilter: Bool {
        !searchText.isEmpty ||
        ageSelection != .none ||
        typeSelection != .none
    }

    func search() {
        Task {
            let animals = await animalSearcher.searchAnimal(by: searchText, age: ageSelection, type: typeSelection)

            do {
                try await animalStore.save(animals: animals)
            } catch {
                print("Error storing animals... \(error.localizedDescription)")
            }
        }
    }

    func clearFilters() {
        typeSelection = .none
        ageSelection = .none
    }

    func selectTypeSuggestion(_ type: AnimalSearchType) {
        typeSelection = type
        search()
    }
}
