//
//  OnboardingButtonStyle.swift
//  PetPurrsuitOnboarding
//
//  Created by Sarah Clark on 3/9/24.
//

import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(color)
            .clipShape(Capsule())
            .buttonStyle(.plain)
            .padding(.horizontal, 20)
            .foregroundStyle(Color.white)
    }
}
