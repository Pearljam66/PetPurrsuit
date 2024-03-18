//
//  SearchAnimalsMainView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

struct SearchAnimalsMainView: View {
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    )
    private var animals: FetchedResults<AnimalEntity>

    @StateObject var viewModel = AnimalSearchViewModel(
        animalSearcher: AnimalSearcherService(requestManager: RequestManager()),
        animalStore: AnimalStoreService(
            context: PersistenceController.shared.container.newBackgroundContext()
        )
    )

    var filteredAnimals: [AnimalEntity] {
        guard viewModel.shouldFilter else { return [] }
        return filterAnimals()
    }

    @State var filterPickerIsPresented = false

    private var filterAnimals: FilterAnimals {
        FilterAnimals(
            animals: animals,
            query: viewModel.searchText,
            age: viewModel.ageSelection,
            type: viewModel.typeSelection
        )
    }

    var body: some View {
        NavigationView {
            AnimalListView(animals: filteredAnimals)
                .navigationTitle("Find your future friend")
                .searchable(
                    text: $viewModel.searchText,
                    placement: .navigationBarDrawer(displayMode: .always)
                )
                .onChange(of: viewModel.searchText) {
                    viewModel.search()
                }
                .overlay {
                    if filteredAnimals.isEmpty && !viewModel.searchText.isEmpty {
                        EmptySearchResultsView(query: viewModel.searchText)
                    }
                }
                .toolbar {
                    ToolbarItem {
                        Button {
                            filterPickerIsPresented.toggle()
                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .font(.title)
                                .accessibilityLabel("Filter")
                        }
                        .foregroundColor(.petorange)
                        .sheet(isPresented: $filterPickerIsPresented) {
                            NavigationView {
                                SearchFiltersView(viewModel: viewModel)
                            }
                        }
                    }
                }
        }
    }
}

struct SearchAnimalsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchAnimalsMainView(
            viewModel: AnimalSearchViewModel(
                animalSearcher: AnimalSearcherMock(),
                animalStore: AnimalStoreService(
                    context: PersistenceController.preview.container.viewContext
                )
            )
        )
        .environment(
            \.managedObjectContext,
             PersistenceController.preview.container.viewContext
        )
    }
}
