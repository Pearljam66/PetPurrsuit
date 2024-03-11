//
//  AnimalContactLink.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct AnimalContactLink: View {
    let title: String
    let iconName: String
    let url: URL
    let color: Color

    var body: some View {
        Link(destination: url) {
            VStack(spacing: 4) {
                Image(systemName: iconName)
                    .imageScale(.large)
                Text(title)
                    .font(Font.custom("Roboto-Medium", size: 16, relativeTo: .callout))
                    .accessibility(label: Text("The contact information for this pet: " + title))
            }
            .foregroundColor(color)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
        }
        .padding(.vertical)
        .frame(maxWidth: .infinity)
        .background(color.opacity(0.1))
        .cornerRadius(8)
    }
}

struct AnimalContactLink_Previews: PreviewProvider {
    static var previews: some View {
        if let url = URL(string: "www.apple.com") {
            AnimalContactLink(
                title: "(555) 394-2033",
                iconName: "phone.fill",
                url: url,
                color: .green
            )
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}
