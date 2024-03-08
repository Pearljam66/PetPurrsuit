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
    @StateObject var viewModel = AnimalSearchViewModel(
        animalSearcher: AnimalSearcherService(requestManager: RequestManager()),
        animalStore: AnimalStoreService(context: PersistenceController.shared.container.newBackgroundContext()))

    var filteredAnimals: [AnimalEntity] {
        guard viewModel.shouldFilter else { return [] }
        return animals.filter {
            if viewModel.searchText.isEmpty {
                return true
            }
            return $0.name?.contains(viewModel.searchText) ?? false
        }
    }

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .searchable(
                    text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                )
                .onChange(of: viewModel.searchText) { _ in
                    viewModel.search()
                }
                .navigationTitle("Find your future pet")
        }
    }
}

#Preview {
    SearchAnimalsView()
}
