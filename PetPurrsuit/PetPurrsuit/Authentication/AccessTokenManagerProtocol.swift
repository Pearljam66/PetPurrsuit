//
//  AccessTokenManagerProtocol.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/8/24.
//

import Foundation

protocol AccessTokenManagerProtocol {
    func isTokenValid() -> Bool
    func fetchToken() -> String
    func refreshWith(apiToken: PetFinderAPIToken) throws
}
