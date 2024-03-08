//
//  SearchAnimalsView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

struct SearchAnimalsView: View {
    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)],
        animation: .default)
    private var animals: FetchedResults<AnimalEntity>

    var body: some View {
        NavigationView {
            AnimalListView(animals: animals)
                .navigationTitle("Find your future pet")
        }
    }
}

#Preview {
    SearchAnimalsView()
}
