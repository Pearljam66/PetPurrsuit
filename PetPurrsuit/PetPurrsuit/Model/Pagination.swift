//
//  PageResults.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

struct Pagination: Codable {
    // Default: 1.
    // Specifies which page of results to return.
    // TODO: Come up with a better name.
    let pageToBeReturned: Int
    // Default: 20, Max: 100
    // Maximum number of results to return per 'page' response.
    let pageResultsMax: Int
}
