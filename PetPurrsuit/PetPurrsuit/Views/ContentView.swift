//
//  ContentView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 2/1/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        TabView {
            AnimalsNearByView()
                .tabItem {
                    Label("Nearby", systemImage: "location")
                }
            SearchAnimalsView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}


#Preview {
    ContentView()
}
