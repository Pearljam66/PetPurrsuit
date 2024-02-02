//
//  AnimalPhotoSizes.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import Foundation

struct AnimalPhotoSizes: Codable {
    var id: Int?
    var small: URL?
    var medium: URL?
    var large: URL?
    var full: URL?
}
