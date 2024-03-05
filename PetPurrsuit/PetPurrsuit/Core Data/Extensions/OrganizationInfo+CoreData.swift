//
//  OrganizationInfo+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension OrganizationInfo: CoreDataPersistable {

    var keyMap: [PartialKeyPath<OrganizationInfo>: String] {
        [
            \.distance: "distance",
            \.contact: "contact"
        ]
    }

    init(managedObject: OrganizationEntity?) {
        guard let managedObject = managedObject else { return }
        self.id = Int(managedObject.id)
        self.distance = managedObject.distance
        guard let contact = managedObject.contactInfo else { return }
        self.contact = ContactInfo(managedObject: contact)
    }

    mutating func convertToManagedCoreObject(context: NSManagedObjectContext = PersistenceController.shared.container.viewContext) -> OrganizationEntity {
        let persistedValue = OrganizationEntity.init(context: context)
        persistedValue.distance = self.distance ?? 0.0

        if var contact = self.contact {
            persistedValue.contactInfo = contact.convertToManagedCoreObject(context: context)
        }
        return persistedValue
    }

}
