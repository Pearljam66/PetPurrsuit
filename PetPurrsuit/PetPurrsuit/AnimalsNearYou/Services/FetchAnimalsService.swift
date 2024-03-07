//
//  FetchAnimalsService.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/6/24.
//

struct FetchAnimalsService {
    private let requestManager: RequestManagerProtocol

    init(requestManager: RequestManagerProtocol) {
        self.requestManager = requestManager
    }
}

extension FetchAnimalsService: AnimalsFetcher {

    func fetchAnimals(page: Int) async -> [Animal] {
        let requestData = AnimalsRequest.getAnimalsWith(page: page, latitude: nil, longitude: nil)
        do {
            let animalsContainer:AnimalsContainer = try await requestManager.perform(requestData)
            return animalsContainer.animals
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}
