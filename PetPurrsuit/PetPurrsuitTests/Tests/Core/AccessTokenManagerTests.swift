//
//  AccessTokenManagerTests.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 2/10/24.
//

import XCTest
@testable import PetPurrsuit

class AccessTokenManagerTests: XCTestCase {
    var userDefaults: UserDefaults!

    override func setUp() {
        super.setUp()
        userDefaults = UserDefaults(suiteName: #file)
    }

    override func tearDown() {
        userDefaults.removePersistentDomain(forName: "AccessTokenManagerTests")
        super.tearDown()
    }

    func testFetchToken() {
        let expectedToken = "testToken"
        userDefaults.set(expectedToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
        let accessTokenManager = AccessTokenManagerMock(accessToken: expectedToken, expiresAt: nil)
        let fetchedToken = accessTokenManager.fetchToken()

        XCTAssertEqual(fetchedToken, expectedToken)
    }

    func testRefreshToken() {
        let apiToken = AccessTokenMockHelper.randomAPIToken()
        let token = AccessTokenMockHelper.randomAPIToken()
        let accessTokenManager = AccessTokenManagerMock(accessToken: nil, expiresAt: nil)

        XCTAssertNoThrow(try accessTokenManager.refreshWith(apiToken: apiToken))
        XCTAssertEqual(accessTokenManager.fetchToken(), apiToken.bearerAccessToken)
        XCTAssertTrue(accessTokenManager.isTokenValid())
        XCTAssertNotEqual(token.bearerAccessToken, accessTokenManager.fetchToken())
    }

    func testRequestToken() {

        let apiToken = AccessTokenMockHelper.randomAPIToken()
        let accessTokenManager = AccessTokenManagerMock(accessToken: apiToken.bearerAccessToken, expiresAt: nil)
        let fetchedToken = accessTokenManager.fetchToken()

        XCTAssertFalse(fetchedToken.isEmpty)
    }

    func testIsTokenValid() {
        let apiToken = AccessTokenMockHelper.randomAPIToken()
        let futureDate = Date().addingTimeInterval(3600)
        let accessTokenManager = AccessTokenManagerMock(accessToken: apiToken.bearerAccessToken, expiresAt: futureDate)
        let isTokenValid = accessTokenManager.isTokenValid()

        XCTAssertTrue(isTokenValid)
    }

    func testCachedToken() {
        let expectedToken = AccessTokenMockHelper.randomAPIToken().bearerAccessToken
        userDefaults.set(expectedToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
        let accessTokenManager = AccessTokenManagerMock(accessToken: expectedToken, expiresAt: nil)
        let firstFetchToken = accessTokenManager.fetchToken()
        let secondFetchToken = accessTokenManager.fetchToken()

        XCTAssertEqual(firstFetchToken, expectedToken)
        XCTAssertEqual(secondFetchToken, expectedToken)
    }

    func testExpiredToken() {
        let expiredToken = AccessTokenMockHelper.randomAPIToken()
        userDefaults.set(expiredToken.bearerAccessToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
        let pastDate = Date().addingTimeInterval(-3600) // 1 hour ago
        userDefaults.set(pastDate.timeIntervalSince1970, forKey: AppUserDefaultsKeys.expiresAt)
        let accessTokenManager = AccessTokenManagerMock(accessToken: nil, expiresAt: nil)
        let isTokenValid = accessTokenManager.isTokenValid()

        XCTAssertFalse(isTokenValid)
    }

    func testInvalidToken() {
        userDefaults.set("", forKey: AppUserDefaultsKeys.bearerAccessToken)
        let accessTokenManager = AccessTokenManagerMock(accessToken: nil, expiresAt: nil)
        let isTokenValid = accessTokenManager.isTokenValid()

        XCTAssertFalse(isTokenValid)
    }

    func testTokenRefreshedSuccessfully() {
        let apiToken = AccessTokenMockHelper.randomAPIToken()
        let accessTokenManager = AccessTokenManagerMock(accessToken: nil, expiresAt: nil)
        XCTAssertNoThrow(try accessTokenManager.refreshWith(apiToken: apiToken))
        let isTokenValid = accessTokenManager.isTokenValid()

        XCTAssertTrue(isTokenValid)
    }

    func testLoadTokenFromUserDefaults() {
        let apiToken = AccessTokenMockHelper.randomAPIToken()
        userDefaults.set(apiToken.bearerAccessToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
        userDefaults.set(apiToken.expiresAt.timeIntervalSince1970, forKey: AppUserDefaultsKeys.expiresAt)
        let accessTokenManager = AccessTokenManagerMock(accessToken: apiToken.bearerAccessToken, expiresAt: nil)
        let fetchedToken = accessTokenManager.fetchToken()

        XCTAssertEqual(fetchedToken, apiToken.bearerAccessToken)
    }
}
