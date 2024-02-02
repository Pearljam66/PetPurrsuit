//
//  AnimalAttributes.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

struct AnimalBehaviorAttributes: Codable {
    var id: Int?
    // These values can be true, false, 1 or 0.
    var goodWithChildren: Bool?
    var goodWithDogs: Bool?
    var goodWithCats: Bool?

    // These values can only be true or 1.
    var houseTrained: Bool?
    var declawed: Bool?
    var specialNeeds: Bool?
    var shotsCurrent: Bool?
}
