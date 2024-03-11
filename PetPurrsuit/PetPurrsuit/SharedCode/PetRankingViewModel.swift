//
//  PetRankingViewModel.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

final class PetRankingViewModel: ObservableObject {
    var animal: AnimalEntity

    var ranking: Int {
        didSet {
            animal.ranking = Int32(ranking)
            objectWillChange.send()
        }
    }

    init(animal: AnimalEntity) {
        self.animal = animal
        self.ranking = Int(animal.ranking)
    }
}
