//
//  APIManagerProtocol.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

import Foundation

protocol APIManagerProtocol {
    func perform(_ request: NetworkRequestProtocol, authToken: String) async throws -> Data
    func requestToken() async throws -> Data
}
