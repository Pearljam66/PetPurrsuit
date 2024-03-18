//
//  AnimalSearchType.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

import SwiftUI

enum AnimalSearchType: String, CaseIterable {
    case none
    case cat
    case dog
    case rabbit = "Rabbit"
    case smallAndFurry = "Small & furry"
    case horse
    case bird
    case scalesFinsAndOther = "Scales, Fins, and Other"
    case farm
}

extension AnimalSearchType {
    var suggestionImage: Image {
        switch self {
        case .cat:
            return Image(systemName: "cat.circle.fill")
        case .dog:
            return Image(systemName: "dog.circle.fill")
        case .rabbit:
            return Image(systemName: "hare.circle.fill")
        case .smallAndFurry:
            return Image("smallAndFurry")
        case .bird:
            return Image(systemName: "bird.circle.fill")
        case .scalesFinsAndOther:
            return Image(systemName: "fish.circle.fill")
        default:
            return Image(rawValue)
        }
    }
}

extension AnimalSearchType {
    static var suggestions: [AnimalSearchType] {
        var suggestions = AnimalSearchType.allCases
        suggestions.removeFirst()
        return suggestions
    }
}
