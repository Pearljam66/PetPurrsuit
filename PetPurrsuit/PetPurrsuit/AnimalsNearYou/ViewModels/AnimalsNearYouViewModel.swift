//
//  AnimalsNearYouViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import SwiftUI

final class AnimalsNearYouViewModel: ObservableObject {
    @Published var isLoading: Bool
    private let animalFetcher: AnimalsFetcher

    init(isLoading: Bool = true, animalFetcher: AnimalsFetcher) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
    }

    func fetchAnimals() async {
        let animals = await animalFetcher.fetchAnimals(page: 1)
        for var animal in animals {
            animal.convertToManagedCoreObject()
        }
        isLoading = false
    }

}
