//
//  AnimalAttributes.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

struct AnimalBehaviorAttributes: Codable {
    var id: Int?

    // These values can only be true or 1.
    var spayedOrNeutered: Bool?
    var houseTrained: Bool?
    var declawed: Bool?
    var specialNeeds: Bool?
    var shotsCurrent: Bool?
}
