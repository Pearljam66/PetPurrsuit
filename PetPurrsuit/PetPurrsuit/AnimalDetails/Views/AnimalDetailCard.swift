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
                .font(.subheadline)
            Text(value)
                .font(.headline)
                .fontWeight(.bold)
        }
        .padding(.vertical)
        .frame(width: 80)
        .background(color.opacity(0.3))
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
                color: .petmediumblue
            )
            AnimalDetailCard(
                title: "Age",
                value: "Baby",
                color: .petmediumblue
            )
        }
    }
}
