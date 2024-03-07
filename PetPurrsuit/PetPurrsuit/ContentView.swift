//
//  ContentView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import CoreData
import SwiftUI

struct ContentView: View {
    let managedObjectContext = PersistenceController.shared.container.viewContext

    var body: some View {
        TabView {
            AnimalsNearYouView(viewModel: AnimalsNearYouViewModel(animalFetcher: FetchAnimalsService(requestManager: RequestManager())))
                .tabItem {
                    Label("Nearby", systemImage: "location")
                }
                .environment(\.managedObjectContext, managedObjectContext)
            SearchAnimalsView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .environment(\.managedObjectContext, managedObjectContext)
        }
    }
}

#Preview {
    ContentView()
}
