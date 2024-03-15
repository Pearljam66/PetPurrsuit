//
//  EmptySearchResultsView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

import SwiftUI

struct EmptySearchResultsView: View {
    let query: String

    var body: some View {
        VStack {
            Image(systemName: "pawprint.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
                .foregroundColor(.petlightblue)
            Text("Sorry, we couldn't find any results for \"\(query)\".")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptySearchResultsView(query: "Kiki")
}
