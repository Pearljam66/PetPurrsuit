//
//  CoreDataPersistable.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/22/24.
//

import CoreData

protocol UUIDIdentifiable: Identifiable {
    var id: Int? { get set }
}

protocol CoreDataPersistable: UUIDIdentifiable {

    associatedtype ManagedType

    init()

    init(managedObject: ManagedType?)

    var keyMap: [PartialKeyPath<Self>: String] { get }

    mutating func saveStructToCoreDataStore(context: NSManagedObjectContext) -> ManagedType

    func save(context: NSManagedObjectContext) throws
}

extension CoreDataPersistable where ManagedType: NSManagedObject {

        init(managedObject: ManagedType?) {
            self.init()

            guard let managedObject = managedObject else { return }

            for attribute in managedObject.entity.attributesByName {
                if let keyPathValuePair = keyMap.first(where: { $0.value == attribute.key })?.key {
                        let value = managedObject.value(forKey: attribute.key)
                        storeValue(value, toKeyPath: keyPathValuePair)
                    }
                }
            }

    private mutating func storeValue(_ value: Any?, toKeyPath partial: AnyKeyPath) {
        switch partial {
        case let keyPath as WritableKeyPath<Self, URL?>:
            self[keyPath: keyPath] = value as? URL
        case let keyPath as WritableKeyPath<Self, Int?>:
            self[keyPath: keyPath] = value as? Int
        case let keyPath as WritableKeyPath<Self, String?>:
            self[keyPath: keyPath] = value as? String
        case let keyPath as WritableKeyPath<Self, Bool?>:
            self[keyPath: keyPath] = value as? Bool
        default:
            return
        }

        }

}
