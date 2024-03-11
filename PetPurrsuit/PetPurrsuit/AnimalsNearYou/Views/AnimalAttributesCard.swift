//
//  AnimalAttributesCard.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/7/24.
//

import SwiftUI

struct AnimalAttributesCard: ViewModifier {
    let color: Color

    func body(content: Content) -> some View {
        content
            .padding(4)
            .background(color.opacity(0.2))
            .cornerRadius(8)
            .foregroundColor(color)
            .font(Font.custom("Roboto-Medium", size: 16, relativeTo: .subheadline))
    }
}
