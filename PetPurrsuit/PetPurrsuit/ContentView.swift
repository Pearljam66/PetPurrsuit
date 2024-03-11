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

            SearchAnimalsView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environment(\.managedObjectContext, managedObjectContext)
        }
        .environmentObject(locationManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(LocationManager())
    }
}
