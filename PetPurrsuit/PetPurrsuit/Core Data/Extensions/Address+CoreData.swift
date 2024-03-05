//
//  Address+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension Address: CoreDataPersistable {
    typealias ManagedType = AddressEntity

    var keyMap: [PartialKeyPath<Address>: String] {
        [
            \.address1: "address1",
             \.address2: "address2",
             \.city: "city",
             \.state: "state",
             \.postcode: "postcode",
             \.country: "country",
             \.id: "id"
        ]
    }

}
