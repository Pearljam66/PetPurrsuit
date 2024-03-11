//
//  AnimalLocationView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import MapKit
import SwiftUI

struct AnimalLocationView: View {
    let animal: AnimalEntity

    @StateObject var addressFetcher = AddressFetcher()

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("Location")
                .font(Font.custom("Roboto-Medium", size: 16, relativeTo: .headline))
            Text(animal.address)
                .font(Font.custom("Roboto-Medium", size: 16, relativeTo: .subheadline))
                .textSelection(.enabled)

            Button(action: openAddressInMaps) {
                Map(coordinateRegion: $addressFetcher.coordinates, interactionModes: [])
            }
            .buttonStyle(.plain)
            .frame(height: 200)
            .cornerRadius(16)
            .task {
                await addressFetcher.search(by: animal.address)
            }
        }
    }

    func openAddressInMaps() {
        let placemark = MKPlacemark(coordinate: addressFetcher.coordinates.center)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: nil)
    }
}

struct AnimalLocationView_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            AnimalLocationView(animal: animal)
                .padding()
                .previewLayout(.sizeThatFits)
        }
    }
}
