//
//  FetchAnimalsService.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

import Foundation

actor FetchAnimalsService {
    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension FetchAnimalsService: AnimalsFetcher {
    func fetchAnimals(
        page: Int,
        latitude: Double?,
        longitude: Double?
    ) async -> [Animal] {
        let requestData = AnimalsRequest.getAnimalsWith(
            page: page,
            latitude: latitude,
            longitude: longitude
        )
        do {
            let animalsContainer: AnimalsContainer = try await
            requestManager.perform(requestData)
            return animalsContainer.animals
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
}
