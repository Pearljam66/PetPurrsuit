//
//  AnimalSearcherMock.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

struct AnimalSearcherMock: AnimalSearcher {
    func searchAnimal(by text: String, age: AnimalSearchAge, type: AnimalSearchType) async -> [Animal] {
        var animals = Animal.animalMock
        if age != .none {
            animals = animals.filter {
                $0.age.rawValue.lowercased() == age.rawValue.lowercased()
            }
        }
        if type != .none {
            animals = animals.filter {
                $0.type.lowercased() == type.rawValue.lowercased()
            }
        }
        return animals.filter { $0.name.contains(text) }
    }
}
