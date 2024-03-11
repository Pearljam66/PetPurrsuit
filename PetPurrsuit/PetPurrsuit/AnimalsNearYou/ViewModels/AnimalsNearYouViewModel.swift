//
//  AnimalsNearYouViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import CoreLocation
import SwiftUI

@MainActor
final class AnimalsNearYouViewModel: ObservableObject {
    @Published var isLoading: Bool
    @Published var hasMoreAnimals = true
    private let animalFetcher: AnimalsFetcher
    private let animalStore: AnimalStore

    private(set) var page = 1

    init(
        isLoading: Bool = true,
        animalFetcher: AnimalsFetcher,
        animalStore: AnimalStore
    ) {
        self.isLoading = isLoading
        self.animalFetcher = animalFetcher
        self.animalStore = animalStore
    }

    func fetchAnimals(location: CLLocation?) async {
        isLoading = true
        do {
            let animals = await animalFetcher.fetchAnimals(
                page: page,
                latitude: location?.coordinate.latitude,
                longitude: location?.coordinate.longitude
            )
            try await animalStore.save(animals: animals)
            hasMoreAnimals = !animals.isEmpty
        } catch {
            print("Error fetching animals... \(error.localizedDescription)")
        }
        isLoading = false
    }

    func fetchMoreAnimals(location: CLLocation?) async {
        page += 1
        await fetchAnimals(location: location)
    }
}
