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

    private var filterAnimals: FilterAnimals {
        FilterAnimals(animals: animals, query: viewModel.searchText, age: viewModel.ageSelection, type: viewModel.typeSelection)
    }

    @State var filterPickerIsPresented = false

    var filteredAnimals: [AnimalEntity] {
        guard viewModel.shouldFilter else { return [] }
        return filterAnimals()
    }

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .searchable(
                    text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                )
                .onChange(of: viewModel.searchText) {
                    viewModel.search()
                }
                .navigationTitle("Find your future pet")
                .overlay {
                    if filteredAnimals.isEmpty && !viewModel.searchText.isEmpty {
                        EmptyResultsView(query: viewModel.searchText)
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            filterPickerIsPresented.toggle()
                        } label: {
                            Label("Filter", systemImage: "slider.horizontal.3")
                        }
                        .sheet(isPresented: $filterPickerIsPresented) {
                            NavigationView {
                                SearchFilterView(viewModel: viewModel)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    SearchAnimalsView(
        viewModel: AnimalSearchViewModel(animalSearcher: AnimalSearcherMock(),
                                         animalStore: AnimalStoreService(context: PersistenceController.shared.container.viewContext))
    )
    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
