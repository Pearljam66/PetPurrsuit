//
//  RequestProtocol.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/2/24.
//

import Foundation

protocol NetworkRequestProtocol {
    var endpointPath: String { get }
    var requestHeaders: [String: String] { get }
    var requestParams: [String: Any] { get }
    var urlQueryParams: [String: String?] { get }
    var authorizationTokenRequired: Bool { get }
    var requestType: NetworkRequestType { get }
}

extension NetworkRequestProtocol {
    var host: String {
        PetFinderAPIConstants.hostName
    }

    var requestHeaders: [String: String] {
        [:]
    }

    var requestParams: [String: Any] {
        [:]
    }

    var urlQueryParams: [String: String?] {
        [:]
    }

    var authorizationTokenRequired: Bool {
        true
    }

    func createURLRequest(authToken: String) throws -> URLRequest {
        // Construct URLComponents.
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = endpointPath

        if !urlQueryParams.isEmpty {
            urlComponents.queryItems = urlQueryParams.map {
                URLQueryItem(name: $0, value: $1)
            }
        }

        // Create URLRequest.
        guard let url = urlComponents.url else { throw NetworkError.invalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue

        // Set headers.
        if !requestHeaders.isEmpty {
            urlRequest.allHTTPHeaderFields = requestHeaders
        }

        // Add authorization token if it's required.
        if authorizationTokenRequired {
            urlRequest.setValue(authToken, forHTTPHeaderField: "Authorization")
        }

        // The Petfinder API expects data to be in the JSON format.
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Set request body if parameters are provided.
        if !requestParams.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: requestParams)
        }

        return urlRequest
    }

}
