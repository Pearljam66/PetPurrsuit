//
//  Animal.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import Foundation

struct Animal: Codable {
    var id: Int?
    let organizationId: String?
    let url: URL?
    let type: String
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
    let status: AnimalAdoptionStatus
    var attributes: AnimalBehaviorAttributes
    var environment: AnimalEnvironment?
    let tags: [String]
    var contact: ContactInfo
    let publishedAt: String?
    let distance: Double?
    var ranking: Int? = 0

    var picture: URL? {
        photos.first?.medium ?? photos.first?.large
    }
}

extension Animal: Identifiable {
}
