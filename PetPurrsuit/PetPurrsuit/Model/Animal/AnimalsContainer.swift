//
//  AnimalsContainer.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

struct AnimalsContainer: Decodable {
    let animals: [Animal]
    let pagination: Pagination
}
