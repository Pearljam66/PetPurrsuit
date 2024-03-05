//
//  Breed+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/4/24.
//

import CoreData

extension AnimalBreed: CoreDataPersistable {
    typealias ManagedType = BreedEntity

    var keyMap: [PartialKeyPath<AnimalBreed>: String] {
        [
            \.primary: "primary",
            \.secondary: "secondary",
            \.mixed: "mixed",
            \.unknown: "unknown",
            \.id: "id"
         ]
    }
}
