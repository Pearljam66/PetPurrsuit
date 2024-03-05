//
//  AnimalVideo+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension AnimalVideo: CoreDataPersistable {
    typealias ManagedType = VideoEntity

    var keyMap: [PartialKeyPath<AnimalVideo>: String] {
        [
            \.embeddedVideoURL: "embedded",
            \.id: "id"
        ]
    }

}
