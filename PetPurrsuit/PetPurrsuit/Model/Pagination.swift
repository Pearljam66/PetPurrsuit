//
//  PageResults.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

struct Pagination: Codable {
    let countPerPage: Int
    let totalCount: Int
    let currentPage: Int
    let totalPages: Int
}
