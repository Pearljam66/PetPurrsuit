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
    @State var searchText = ""

    var filteredAnimals: [AnimalEntity] {
        animals.filter {
            if searchText.isEmpty {
                return true
            }
            return $0.name?.contains(searchText) ?? false
        }
    }

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                )
                .navigationTitle("Find your future pet")
        }
    }
}

#Preview {
    SearchAnimalsView()
}
