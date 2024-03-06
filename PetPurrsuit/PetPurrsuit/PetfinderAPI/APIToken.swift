//
//  APIToken.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import Foundation

struct APIToken {
    let tokenType: String
    let expiresIn: Int
    let accessToken: String
    private let requestedAt = Date()
}

// MARK: - Codable
extension APIToken: Codable {
    enum CodingKeys: String, CodingKey {
        case tokenType
        case expiresIn
        case accessToken
    }
}

// MARK: - Helper properties
extension APIToken {
    var expiresAt: Date {
        Calendar.current.date(byAdding: .second, value: expiresIn, to: requestedAt) ?? Date()
    }

    var bearerAccessToken: String {
        "\(tokenType) \(accessToken)"
    }
}
