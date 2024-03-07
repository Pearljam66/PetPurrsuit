//
//  AnimalsNearYouView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

struct AnimalsNearYouView: View {
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \AnimalEntity.timestamp, ascending: true)
        ],
        animation: .default
    )
    private var animals: FetchedResults<AnimalEntity>
    @ObservedObject var viewModel: AnimalsNearYouViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailsView()) {
                                AnimalRowView(animal: animal)
                            }
                        }
                if !animals.isEmpty && viewModel.hasMoreAnimals {
                    ProgressView("Finding more animals...")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .task {
                            await viewModel.fetchAnimals()
                    }
                }
            }
            .task {
                await viewModel.fetchAnimals()
            }
            .listStyle(.plain)
            .navigationTitle("Animals near by")
            .overlay {
                if viewModel.isLoading && animals.isEmpty {
                    ProgressView("Finding animals near you")
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AnimalsNearYouView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalsNearYouView(viewModel: AnimalsNearYouViewModel(
            animalFetcher: AnimalsFetcherMock(),
            animalStore: AnimalStoreService(context: CoreDataHelper.previewContext)
        )
    )
    .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
