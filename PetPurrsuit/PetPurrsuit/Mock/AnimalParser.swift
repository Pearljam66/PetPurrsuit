//
//  AnimalMockDataParser.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import Foundation

struct AnimalParser {

    static func parseAnimalsFromMockData() throws -> [Animal] {
        guard let jsonData = try loadMockData() else {
            throw NSError(domain: "PetPurrsuit", code: 404, userInfo: [NSLocalizedDescriptionKey: "AnimalMockData.json not found."])
        }

        return try decodeJSONData(jsonData, as: [Animal].self)
    }

    private static func decodeJSONData<T: Decodable>(_ jsonData: Data, as type: T.Type) throws -> T {
        let decoder = JSONDecoder()

        do {
            return try decoder.decode(type, from: jsonData)
        } catch {
            throw error
        }
    }

    private static func loadMockData() throws -> Data? {
        guard let url = Bundle.main.url(forResource: "AnimalMockData", withExtension: "json") else {
            throw NSError(domain: "PetPurrsuit", code: 404, userInfo: [NSLocalizedDescriptionKey: "AnimalMockData.json not found."])
        }

        return try Data(contentsOf: url)
    }
}
