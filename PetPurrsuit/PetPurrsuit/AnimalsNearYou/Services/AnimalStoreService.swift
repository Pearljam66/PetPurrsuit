//
//  AnimalStoreService.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

import CoreData

struct AnimalStoreService {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }
}

extension AnimalStoreService: AnimalStore {

    func save(animals: [Animal]) async throws {
        for var animal in animals {
            animal.convertToManagedCoreObject(context: context)
        }
        try context.save()
    }

}
