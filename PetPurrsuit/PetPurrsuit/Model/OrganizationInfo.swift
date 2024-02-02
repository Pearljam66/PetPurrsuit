//
//  OrganizationInfo.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

struct OrganizationInfo: Codable {
    var id: Int?
    var contact: ContactInfo?
    // Requires location to be set.
    var distance: Double?
}
