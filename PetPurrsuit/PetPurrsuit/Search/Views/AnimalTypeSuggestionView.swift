//
//  AnimalTypeSuggestionView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

import SwiftUI

struct AnimalTypeSuggestionView: View {
    let suggestion: AnimalSearchType

    private var gradientColors: [Color] {
        [Color.clear, Color.black]
    }

    @ViewBuilder private var gradientOverlay: some View {
        LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .opacity(0.4)
    }

    var body: some View {
        suggestion.suggestionImage
            .resizable()
            .aspectRatio(2, contentMode: .fit)
            .frame(height: 100)
            .overlay(gradientOverlay)
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
        AnimalTypeSuggestionView(suggestion: AnimalSearchType.cat)
            .previewLayout(.sizeThatFits)
        AnimalTypeSuggestionView(suggestion: AnimalSearchType.cat)
            .previewLayout(.sizeThatFits)
            .environment(\.locale, .init(identifier: "es"))
            .previewDisplayName("Spanish Locale")
    }
}
