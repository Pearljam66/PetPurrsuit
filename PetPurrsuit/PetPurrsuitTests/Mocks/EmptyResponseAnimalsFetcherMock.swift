//
//  EmptyResponseAnimalsFetcherMock.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 3/7/24.
//

@testable import PetPurrsuit

struct EmptyResponseAnimalsFetcherMock: AnimalsFetcher {
    func fetchAnimals(page: Int, latitude: Double?, longitude: Double?) async -> [Animal] {
        return []
    }
}
