//
//  RequestLocationView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import CoreLocationUI
import SwiftUI

struct RequestLocationView: View {
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            Image(systemName: "dog")
                .resizable()
                .frame(width: 240, height: 240)
            Text("""
            To find pets near you, first, you need to
            share your current location.
            """)
            .multilineTextAlignment(.center)
            LocationButton {
                locationManager.requestWhenInUseAuthorization()
            }
            .symbolVariant(.fill)
            .foregroundStyle(.white)
            .cornerRadius(8)
        }
        .padding()
        .onAppear {
            locationManager.updateAuthorizationStatus()
        }
}

    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }
}

#Preview {
    RequestLocationView()
        .environmentObject(LocationManager())
}
