//
//  AnimalEnvironment+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension AnimalEnvironment: CoreDataPersistable {
    typealias ManagedType = AnimalEnvironmentEntity

    var keyMap: [PartialKeyPath<AnimalEnvironment>: String] {
        [
            \.goodWithCats: "cats",
            \.goodWithDogs: "dogs",
            \.goodWithChildren: "children",
            \.id: "id"
        ]
    }

}
