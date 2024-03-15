//
//  AnimalImage.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/14/24.
//

import SwiftUI

struct AnimalImage: View {
    let animalPicture: URL?
    @Binding var zoomed: Bool
    let geometry: GeometryProxy

    var body: some View {
        AsyncImage(url: animalPicture) { image in
            image
                .resizable()
                .aspectRatio(zoomed ? nil : 1, contentMode: zoomed ? .fit : .fill)
        } placeholder: {
            Image("NoImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay {
                    if animalPicture != nil {
                        ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.gray.opacity(0.4))
                    }
                }
        }
        .clipShape(
            RoundedRectangle(cornerRadius: zoomed ? 0 : 300)
        )
        .frame(
            width: zoomed ? geometry.frame(in: .local).width : 100,
            height: zoomed ? geometry.frame(in: .global).midX : 100
        )
        .offset(
            x: zoomed ? 0 : 0,
            y: zoomed ? geometry.frame(in: .local).midY / 3 : 0
        )
        .scaleEffect((zoomed ? 5 : 3) / 3)
        .shadow(radius: zoomed ? 10 : 1)
        .animation(.spring(), value: zoomed)
        .padding()
    }
}
