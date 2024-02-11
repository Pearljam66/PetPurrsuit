//
//  AccessTokenManagerMock.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 2/10/24.
//

import XCTest
@testable import PetPurrsuit

enum AccessTokenError: Error {
    case tokenExpired
}

class AccessTokenManagerMock: AccessTokenManagerProtocol {

    var accessToken: String?
    var expiresAt: Date?

    init(accessToken: String?, expiresAt: Date?) {
        self.accessToken = accessToken
        self.expiresAt = expiresAt
    }

    func isTokenValid() -> Bool {
        guard let accessToken = accessToken, let expiresAt = expiresAt else {
            return false
        }
        return !accessToken.isEmpty && expiresAt > Date()
    }

    func fetchToken() -> String {
        return accessToken ?? ""
    }

    func refreshWith(apiToken: PetFinderAPIToken) throws {
        guard apiToken.expiresAt > Date() else {
            throw AccessTokenError.tokenExpired
        }
        accessToken = apiToken.bearerAccessToken
        expiresAt = apiToken.expiresAt
    }
}

