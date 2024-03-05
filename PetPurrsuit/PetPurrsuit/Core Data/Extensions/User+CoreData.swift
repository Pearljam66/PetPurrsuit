//
//  User+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension User: CoreDataPersistable {
    typealias ManagedType = UserEntity

    var keyMap: [PartialKeyPath<User>: String] {
        [
            \.name: "name",
            \.password: "password",
            \.extra: "extra",
            \.id: "id"
        ]
    }

}
