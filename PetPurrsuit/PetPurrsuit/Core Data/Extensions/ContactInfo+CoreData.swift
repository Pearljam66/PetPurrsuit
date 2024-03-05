//
//  ContactInfo+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension ContactInfo: CoreDataPersistable {
    typealias ManagedType = ContactInfoEntity

    init(managedObject: ContactInfoEntity?) {
        guard let managedObject = managedObject else { return }
        self.id = Int(managedObject.id)
        self.email = managedObject.email
        self.phone = managedObject.phone
        self.address = Address(managedObject: managedObject.address)
    }

    var keyMap: [PartialKeyPath<ContactInfo>: String] {
        [
            \.email: "email",
            \.phone: "phone",
            \.address: "address"
        ]
    }

    mutating func convertToManagedCoreObject(context: NSManagedObjectContext) -> ManagedType {
        let persistedValue = ContactInfoEntity.init(context: context)
        persistedValue.email = self.email
        persistedValue.phone = self.phone

        if var address = self.address {
            persistedValue.address = address.convertToManagedCoreObject(context: context)
        }
        return persistedValue
    }
}
