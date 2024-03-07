//
//  AnimalAge.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

enum AnimalAge: String, Codable {
    case baby = "Baby"
    case young = "Young"
    case adult = "Adult"
    case senior = "Senior"
    case unknown = "Unknown"
}

extension AnimalAge {
    var color: Color {
        switch self {
        case .baby:
            return .cyan
        case .young:
            return .orange
        case .adult:
            return .green
        case .senior:
            return .blue
        case .unknown:
            return .clear
        }
    }
}
