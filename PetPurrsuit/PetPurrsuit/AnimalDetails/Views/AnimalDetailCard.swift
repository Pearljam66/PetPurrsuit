//
//  AnimalDetailCard.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct AnimalDetailCard: View {
    let title: String
    let value: String
    let color: Color

    var body: some View {
        VStack {
            Text(title)
                .font(Font.custom("Roboto-Medium", size: 16, relativeTo: .subheadline))
            Text(value)
                .font(Font.custom("Roboto-Medium", size: 16, relativeTo: .headline))
        }
        .padding(.vertical)
        .frame(width: 96)
        .background(color.opacity(0.2))
        .foregroundColor(color)
        .cornerRadius(8)
    }
}

struct AnimalDetailCard_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            AnimalDetailCard(
                title: "Age",
                value: "Adult",
                color: .green
            )
            AnimalDetailCard(
                title: "Age",
                value: "Baby",
                color: .blue
            )
        }
    }
}
