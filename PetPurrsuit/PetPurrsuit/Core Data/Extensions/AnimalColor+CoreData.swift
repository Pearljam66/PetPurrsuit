//
//  AnimalColor+CoreData.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/5/24.
//

import CoreData

extension AnimalColor: CoreDataPersistable {
    typealias ManagedType = AnimalColorsEntity

    var keyMap: [PartialKeyPath<AnimalColor>: String] {
        [
          \.primary: "primary",
          \.secondary: "secondary",
          \.tertiary: "tertiary"
        ]
    }

}
