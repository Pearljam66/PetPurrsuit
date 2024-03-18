//
//  AnimalSuggestionsGrid.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

import SwiftUI

struct AnimalSuggestionsStack: View {
    @Environment(\.isSearching) var isSearching: Bool
    let suggestions: [AnimalSearchType]
    var action: (AnimalSearchType) -> Void

    var body: some View {
        LazyVStack(alignment: .center) {
            Text("Browse by Type")
                .padding(.top, 200)
                .font(.title)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
            VStack {
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
    AnimalSuggestionsStack(suggestions: AnimalSearchType.suggestions) { _ in }
}
