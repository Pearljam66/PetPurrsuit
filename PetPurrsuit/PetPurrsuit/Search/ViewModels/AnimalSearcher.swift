//
//  AnimalSearcher.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

protocol AnimalSearcher {
    func searchAnimal(by text: String, age: AnimalSearchAge, type: AnimalSearchType) async -> [Animal]
}
