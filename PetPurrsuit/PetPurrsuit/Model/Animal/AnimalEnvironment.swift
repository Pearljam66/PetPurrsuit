//
//  AnimalEnvironment.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

struct AnimalEnvironment: Codable {
    var id: Int?

    // These values can be true, false, 1 or 0.
    var goodWithChildren: Bool?
    var goodWithDogs: Bool?
    var goodWithCats: Bool?
}
