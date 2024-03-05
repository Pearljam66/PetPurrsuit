//
//  PhotoSizesEntity+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension AnimalPhotoSizes: CoreDataPersistable {

    typealias ManagedType = PhotoSizesEntity

    var keyMap: [PartialKeyPath<AnimalPhotoSizes>: String] {
        [
            \.small: "small",
            \.medium: "medium",
            \.large: "large",
            \.full: "full",
            \.id: "id"
        ]
    }
}
