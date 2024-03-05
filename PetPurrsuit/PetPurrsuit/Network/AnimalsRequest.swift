//
//  AnimalsRequest.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/7/24.
//

enum AnimalsRequest: NetworkRequestProtocol {
    case getAnimals(page: Int, latitude: Double?, longitude: Double?)
    case searchAnimals(name: String, age: String?, type: String?)

    var endpointPath: String {
        "/v2/animals"
    }

    var urlQueryParams: [String: String?] {
        switch self {
        case let .getAnimals(page, latitude, longitude):
            return buildGetAnimalsParams(page: page,
                                        latitude: latitude,
                                        longitude: longitude)

        case let .searchAnimals(name, age, type):
            return buildSearchAnimalsParams(name: name,
                                            age: age,
                                            type: type)
        }
    }

    var requestType: NetworkRequestType {
        .GET
    }

    private func buildGetAnimalsParams(page: Int, latitude: Double?, longitude: Double?) -> [String: String?] {
        var params = ["page": String(page)]
        if let latitude = latitude {
            params["latitude"] = String(latitude)
        }
        if let longitude = longitude {
            params["longitude"] = String(longitude)
        }
        params["sort"] = "random"
        return params
    }

    private func buildSearchAnimalsParams(name: String, age: String?, type: String?) -> [String: String?] {
        var params: [String: String?] = ["name": name.isEmpty ? nil : name]
        if let age = age {
            params["age"] = age.isEmpty ? nil : age
        }
        if let type = type {
            params["type"] = type.isEmpty ? nil : type
        }
        return params
    }

}
