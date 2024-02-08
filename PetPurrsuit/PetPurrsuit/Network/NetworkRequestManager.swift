//
//  RequestManager.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

final class NetworkRequestManager: NetworkRequestManagerProtocol {
    let apiManager: APIManagerProtocol
    let parser: DataParserProtocol
    let accessTokenManager: AccessTokenManagerProtocol

    init(apiManager: APIManagerProtocol = APIManager(), parser: DataParserProtocol = DataParser(), accessTokenManager: AccessTokenManagerProtocol = AccessTokenManager()) {
        self.apiManager = apiManager
        self.parser = parser
        self.accessTokenManager = accessTokenManager
    }

    func perform<T: Decodable>(_ request: NetworkRequestProtocol) async throws -> T {
        let authToken = try await requestAccessToken()
        let data = try await apiManager.perform(request, authToken: authToken)
        let decodedData: T = try parser.parse(data: data)
        return decodedData
    }

    func requestAccessToken() async throws -> String {
        if accessTokenManager.isTokenValid() {
            return accessTokenManager.fetchToken()
        }

        let data = try await apiManager.requestToken()
        let token: PetFinderAPIToken = try parser.parse(data: data)
        try accessTokenManager.refreshWith(apiToken: token)
        return token.bearerAccessToken
    }
}
