//
//  AnimalStore.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

protocol AnimalStore {
    func save(animals: [Animal]) async throws
}
