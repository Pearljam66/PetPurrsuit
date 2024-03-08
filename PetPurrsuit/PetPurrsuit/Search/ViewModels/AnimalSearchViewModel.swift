//
//  AnimalSearchViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

import SwiftUI

final class AnimalSearchViewModel: ObservableObject {
    @Published var searchText = ""

    var shouldFilter: Bool {
        !searchText.isEmpty
    }
}
