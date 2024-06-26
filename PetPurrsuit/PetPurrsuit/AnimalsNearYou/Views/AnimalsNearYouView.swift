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
    @EnvironmentObject var locationManager: LocationManager
    @ObservedObject var viewModel: AnimalsNearYouViewModel

    var body: some View {
        NavigationView {
            if locationManager.locationIsDisabled {
                RequestLocationView()
                    .navigationTitle("Nearby Adoption Pals")
            } else {
                AnimalListView(animals: animals) {
                    if !animals.isEmpty && viewModel.hasMoreAnimals {
                        HStack(alignment: .center) {
                            Text("Loading more animals...")
                        }
                        .task {
                            await viewModel.fetchMoreAnimals(location: locationManager.lastSeenLocation)
                        }
                    }
                }
                .task {
                    await viewModel.fetchAnimals(location: locationManager.lastSeenLocation)
                }
                .listStyle(.plain)
                .navigationTitle("Nearby Adoption Pals")
                .overlay {
                    if viewModel.isLoading && animals.isEmpty {
                        ProgressView("Finding nearby adoption pals...")
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    Group {
        AnimalsNearYouView(
            viewModel: AnimalsNearYouViewModel(
                animalFetcher: AnimalsFetcherMock(),
                animalStore: AnimalStoreService(
                    context: PersistenceController.preview.container.viewContext
                )
            )
        )

        AnimalsNearYouView(
            viewModel: AnimalsNearYouViewModel(
                animalFetcher: AnimalsFetcherMock(),
                animalStore: AnimalStoreService(
                    context: PersistenceController.preview.container.viewContext
                )
            )
        )
        .preferredColorScheme(.dark)
    }
    .environment(
        \.managedObjectContext,
         PersistenceController.preview.container.viewContext
    )
    .environmentObject(LocationManager())
}
