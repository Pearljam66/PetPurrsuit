//
//  RequestManagerProtocol.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

protocol NetworkRequestManagerProtocol {
    func perform<T: Decodable>(_ request: NetworkRequestProtocol) async throws -> T
}
