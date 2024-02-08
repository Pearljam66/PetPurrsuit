//
//  PetfinderAPIToken.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import Foundation

struct PetFinderAPIToken {
    let accessToken: String
    let expiresIn: Int
    let tokenType: String
    private let requestedAt = Date()
}

extension PetFinderAPIToken: Codable {
    enum CodingKeys: String, CodingKey {
        case accessToken
        case expiresIn
        case tokenType
    }
}

extension PetFinderAPIToken {
    var expiresAt: Date {
        Calendar.current.date(byAdding: .second, value: expiresIn, to: requestedAt) ?? Date()
    }

    var bearerAccessToken: String {
        "\(tokenType) \(accessToken)"
    }
}
