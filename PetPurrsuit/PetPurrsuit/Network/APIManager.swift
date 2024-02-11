//
//  APIManager.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import Foundation

class APIManager: APIManagerProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func perform(_ request: NetworkRequestProtocol, authToken: String = "") async throws -> Data {
        let (data, response) = try await urlSession.data(for: request.createURLRequest(authToken: authToken))
        guard let httpResponse = response as? HTTPURLResponse, 
                httpResponse.statusCode == 200 else { throw NetworkError.invalidServerResponse}
        return data
    }

    func requestToken() async throws -> Data {
        try await perform(AuthenticationTokenRequest.authentication)
    }
}
