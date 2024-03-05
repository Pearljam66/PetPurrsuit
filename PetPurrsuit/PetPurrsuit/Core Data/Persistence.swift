//
//  Persistence.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        // swiftlint:disable identifier_name
        for i in 0..<10 {
        // swiftlint:enable identifier_name
            var animal = Animal.animalMock[i]
            animal.convertToManagedCoreObject(context: viewContext)
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "PetPurrsuit")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        container.viewContext.automaticallyMergesChangesFromParent = true
    }

    static func save() {
        let context = PersistenceController.shared.container.viewContext
        guard context.hasChanges else { return }

        do {
            try context.save()
        } catch {
            fatalError("""
            \(#file),\
            \(#function),\
            \(error.localizedDescription)
            """)
        }
    }

}
