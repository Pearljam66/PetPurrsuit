//
//  AnimalSuggestionsGrid.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

import SwiftUI

struct AnimalSuggestionsGrid: View {
    @Environment(\.isSearching) var isSearching: Bool
    let suggestions: [AnimalSearchType]
    var action: (AnimalSearchType) -> Void

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Browse by Type")
                .font(.title)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
            LazyVGrid(columns: columns) {
                ForEach(AnimalSearchType.suggestions, id: \.self) { suggestion in
                    Button {
                        action(suggestion)
                    } label: {
                        AnimalTypeSuggestionIndividualView(suggestion: suggestion)
                    }
                }
            }
        }
    }
}

#Preview {
    AnimalSuggestionsGrid(suggestions: AnimalSearchType.suggestions) { _ in }
}
