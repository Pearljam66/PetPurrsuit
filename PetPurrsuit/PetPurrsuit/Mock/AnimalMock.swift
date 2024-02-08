//
//  AnimalMock.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import Foundation

extension Animal {
    static let animalMock = loadAnimals()
}

private struct AnimalMock: Codable {
    let animals: [Animal]
}

private func loadAnimals() -> [Animal] {
    guard let url = Bundle.main.url(forResource: "AnimalMockData", withExtension: "json"),
            let data = try? Data(contentsOf: url) else { return [] }
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let jsonMock = try? decoder.decode(AnimalMock.self, from: data)
    return jsonMock?.animals ?? []
}
