//
//  AnimalsFetcherMock.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import CoreLocation

struct AnimalsFetcherMock: AnimalsFetcher {
    func fetchAnimals(
        page: Int,
        latitude: Double?,
        longitude: Double?
    ) async -> [Animal] {
        return Animal.animalMock
    }
}
