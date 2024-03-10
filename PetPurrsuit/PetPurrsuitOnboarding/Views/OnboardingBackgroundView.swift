//
//  OnboardingBackgroundView.swift
//  PetPurrsuitOnboarding
//
//  Created by Sarah Clark on 3/9/24.
//

import SwiftUI

struct OnboardingBackgroundView: View {
    let backgroundPets = Pet.backgroundPets

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.mediumBlueColor, Color.lightGreenColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
                .ignoresSafeArea()
        }
    }
}

struct OnboardingBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingBackgroundView()
    }
}
