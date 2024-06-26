//
//  ContentView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    let managedObjectContext = PersistenceController.shared.container.viewContext
    @StateObject var locationManager = LocationManager()

    var body: some View {
        TabView {
            AnimalsNearYouView(
                viewModel: AnimalsNearYouViewModel(
                    animalFetcher: FetchAnimalsService(
                        requestManager:
                            RequestManager()
                    ),
                    animalStore: AnimalStoreService(
                        context: PersistenceController.shared.container.newBackgroundContext()
                    )
                )
            )
            .tabItem {
                Label("Near you", systemImage: "location")
            }
                .environment(\.managedObjectContext, managedObjectContext)

            SearchAnimalsMainView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environment(\.managedObjectContext, managedObjectContext)
            FavoriteAnimalsView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
        .tint(.petorange)
        .environmentObject(locationManager)
    }
}

#Preview {
    ContentView()
        .environmentObject(LocationManager())
}
