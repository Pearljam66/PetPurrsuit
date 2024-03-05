//
//  AnimalBehaviorAttributes+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension AnimalBehaviorAttributes: CoreDataPersistable {
    typealias ManagedType = AnimalBehaviorAttributesEntity

    var keyMap: [PartialKeyPath<AnimalBehaviorAttributes>: String] {
        [
          \.spayedOrNeutered: "spayedNeutered",
          \.houseTrained: "houseTrained",
          \.declawed: "declawed",
          \.specialNeeds: "specialNeeds",
          \.shotsCurrent: "shotsCurrent",
          \.id: "id"
        ]
    }

}
