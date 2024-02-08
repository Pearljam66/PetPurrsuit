//
//  AnimalAdoptionStatus.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

/// The default is adoptable
enum AnimalAdoptionStatus: String, Codable {
    case adoptable
    case adopted
    case found
    case unknown
}
