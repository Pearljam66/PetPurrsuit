//
//  AnimalAdoptionStatus.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

/// The default is adoptable
enum AnimalAdoptionStatus: String, Codable {
    case adoptable = "adoptable"
    case adopted = "adopted"
    case found = "found"
    case unknown = "unknown"
}
