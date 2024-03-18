//
//  AnimalTypeSuggestionIndividualView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

import SwiftUI

struct AnimalTypeSuggestionIndividualView: View {
    let suggestion: AnimalSearchType

    private var gradientColors: [Color] {
        [Color.clear, Color.black]
    }

    var body: some View {
        suggestion.suggestionImage
            .resizable()
            //.background(Color.orange)
            .aspectRatio(2, contentMode: .fit)
            .frame(height: 100)
            .overlay(alignment: .bottomLeading) {
                Text(LocalizedStringKey(suggestion.rawValue
                    .capitalized))
                .padding(12)
                .foregroundColor(.white)
                .font(.title3)
            }
            .cornerRadius(16)

    }
}

struct AnimalTypeSuggestionView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalTypeSuggestionIndividualView(suggestion: AnimalSearchType.cat)
            .previewLayout(.sizeThatFits)
        AnimalTypeSuggestionIndividualView(suggestion: AnimalSearchType.cat)
            .previewLayout(.sizeThatFits)
            .environment(\.locale, .init(identifier: "es"))
            .previewDisplayName("Spanish Locale")
    }
}
