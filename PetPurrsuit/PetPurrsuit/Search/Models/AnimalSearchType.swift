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
    case rabbit
    case smallAndFurry = "small & furry"
    case horse
    case bird
    case scalesFinsAndOther = "scales, fins, & other"
    case barnyard
}

extension AnimalSearchType {
    var suggestionImage: Image {
        switch self {
        case .smallAndFurry:
            return Image("smallAndFurry")
        case .scalesFinsAndOther:
            return Image("scalesFinsAndOther")
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
