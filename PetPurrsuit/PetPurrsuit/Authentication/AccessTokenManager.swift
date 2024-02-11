//
//  AccessTokenManager.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/8/24.
//

import Foundation

class AccessTokenManager {
    private let userDefaults: UserDefaults
    private var accessToken: String?
    private var expiresAt = Date()

    init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
        update()
    }
}

extension AccessTokenManager: AccessTokenManagerProtocol {
    func fetchToken() -> String {
        guard let token = accessToken else { return "" }
        return token
    }

    func refreshWith(apiToken: PetFinderAPIToken) throws {
        let expiresAt = apiToken.expiresAt
        let token = apiToken.bearerAccessToken

        save(token: apiToken)
        self.expiresAt = expiresAt
        self.accessToken = token
    }

    func isTokenValid() -> Bool {
        update()
        return accessToken != nil && expiresAt.compare(Date()) == .orderedDescending
    }
}

private extension AccessTokenManager {
    func save(token: PetFinderAPIToken) {
        userDefaults.set(token.expiresAt.timeIntervalSince1970, forKey: AppUserDefaultsKeys.expiresAt)
        userDefaults.set(token.bearerAccessToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
    }

    func getExpirationDate() -> Date {
       return Date(timeIntervalSince1970: userDefaults.double(forKey: AppUserDefaultsKeys.expiresAt))
    }

    func getToken() -> String? {
        return userDefaults.string(forKey: AppUserDefaultsKeys.bearerAccessToken)
    }

    func update() {
        accessToken = getToken()
        expiresAt = getExpirationDate()
    }
}
