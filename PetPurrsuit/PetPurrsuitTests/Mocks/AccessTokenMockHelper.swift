//
//  AccessTokenTestHelper.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 2/10/24.
//

@testable import PetPurrsuit

enum AccessTokenMockHelper {

    static func mockAccessToken() -> String {
        let randomLetters = "qjfktgexzyvahuprlwdmcnobsi"
        return String(randomLetters.shuffled().prefix(8))
    }

    static func randomAPIToken() -> PetFinderAPIToken {
        return PetFinderAPIToken(accessToken: AccessTokenMockHelper.mockAccessToken(), expiresIn: 10, tokenType: "Bearer")
    }

    static func generateValidToken() -> String {
    """
    {
      "token_type": "Bearer",
      "expires_in": 10,
      "access_token": \"\(mockAccessToken())\"
    }
    """
    }

}
