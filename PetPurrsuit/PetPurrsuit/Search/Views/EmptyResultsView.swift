//
//  EmptyResultsView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/8/24.
//

import SwiftUI

struct EmptyResultsView: View {
    let query: String

    var body: some View {
        VStack {
            Image(systemName: "pawprint.system.fill")
                .resizable()
                .frame(width: 64, height: 64)
                .padding()
                .foregroundColor(.yellow)
            Text("Sorry, we couldn't find animals for \"\(query)\"")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    EmptyResultsView(query: "Kiki")
}
