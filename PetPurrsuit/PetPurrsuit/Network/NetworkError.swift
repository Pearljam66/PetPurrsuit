//
//  NetworkError.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import Foundation

public enum NetworkError: LocalizedError {
    case invalidServerResponse
    case invalidURL

    public var errorDescription: String? {
        switch self {
            case .invalidServerResponse:
                return "Server returned an invalid response"
            case .invalidURL:
                return "URL string is invalid"
        }
    }
}
