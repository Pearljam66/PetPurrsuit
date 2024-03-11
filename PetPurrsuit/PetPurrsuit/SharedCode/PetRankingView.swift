//
//  PetRankingView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct PetRankingView: View {

    @ObservedObject var viewModel: PetRankingViewModel
    var animal: AnimalEntity

    init(animal: AnimalEntity) {
        self.viewModel = PetRankingViewModel(animal: animal)
        self.animal = animal
    }

    var body: some View {
        HStack {
            Text("Rank me!")
                .multilineTextAlignment(.center)
            ForEach(0...4, id: \.self) { index in
                PetRankImage(index:index, recentIndex: $viewModel.ranking)
            }
        }
    }
}

struct PetRankingView_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            PetRankingView(animal: animal)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}
