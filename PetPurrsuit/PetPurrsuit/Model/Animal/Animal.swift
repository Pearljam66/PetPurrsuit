//
//  Animal.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import Foundation

struct Animal: Codable {
    var id: Int?
    let organizationID: String?
    let url: URL?
    let type: String?
    let species: String?
    var breeds: AnimalBreed
    var colors: AnimalColor
    let age: AnimalAge
    let gender: AnimalGender
    let size: AnimalSize
    let coat: AnimalCoat?
    let name: String
    let description: String?
    let photos: [AnimalPhotoSizes]
    let videos: [AnimalVideo]
    let adoptionStatus: AnimalAdoptionStatus
    var behaviorAttributes: AnimalBehaviorAttributes
    var environment: AnimalEnvironment?
    let tags: [String]
    var contact: ContactInfo
    let publishedAt: String?
    let distance: Double?
    var ranking: Int? = 0
}
