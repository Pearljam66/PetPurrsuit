//
//  RequestManagerProtocol.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

protocol RequestManagerProtocol {
    func perform<T: Decodable>(_ request: RequestProtocol) async throws -> T
}
