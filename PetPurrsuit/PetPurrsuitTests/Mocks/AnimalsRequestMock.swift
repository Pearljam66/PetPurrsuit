//
//  AnimalsRequestMock.swift
//  PetPurrsuitTests
//
//  Created by Sarah Clark on 2/10/24.
//

import Foundation
@testable import PetPurrsuit

enum AnimalsRequestMock: NetworkRequestProtocol {

    case getAnimals

    var requestType: NetworkRequestType {
        return .GET
    }

    var endpointPath: String {
        do {
            guard let path = Bundle.main.path(forResource: "AnimalMockData", ofType: "json") else {
                throw NSError(domain: "AnimalsRequestMock", code: 404, userInfo: [NSLocalizedDescriptionKey: "AnimalMockData.json not found."])
            }
            return path
        } catch {
            print("Error retrieving endpoint path: \(error)")
            return ""
        }

    }
}
