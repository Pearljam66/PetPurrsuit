//
//  PetfinderAPIManagerMock.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 2/8/24.
//

import XCTest
@testable import PetPurrsuit

struct PetFinderAPIManagerMock: APIManagerProtocol {

    func perform(_ request: NetworkRequestProtocol, authToken: String) async throws -> Data {
        return try Data(contentsOf: URL(fileURLWithPath: request.endpointPath), options: .mappedIfSafe)
    }

    func requestToken() async throws -> Data {
        Data(AccessTokenMockHelper.generateValidToken().utf8)
    }
}
