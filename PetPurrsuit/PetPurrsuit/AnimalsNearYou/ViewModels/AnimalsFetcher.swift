//
//  AnimalsFetcher.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

protocol AnimalsFetcher {
    func fetchAnimals(
        page: Int,
        latitude: Double?,
        longitude: Double?
    ) async -> [Animal]
}
