//
//  AnimalsFetcherMock.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

struct AnimalsFetcherMock: AnimalsFetcher {

    func fetchAnimals(page: Int) async -> [Animal] {
        Animal.animalMock
    }
}
