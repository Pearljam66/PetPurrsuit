//
//  AnimalHeaderView.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct AnimalHeaderView: View {
    let animal: AnimalEntity

    @Binding var zoomed: Bool
    @Binding var favorited: Bool
    let geometry: GeometryProxy

    var body: some View {
        if zoomed {
            LazyVStack {
                AnimalImage(animalPicture: animal.picture, zoomed: $zoomed, geometry: geometry)
                HeaderTitle(animal: animal, zoomed: $zoomed, geometry: geometry)
            }
        } else {
            HStack {
                AnimalImage(animalPicture: animal.picture, zoomed: $zoomed, geometry: geometry)
                HeaderTitle(animal: animal, zoomed: $zoomed, geometry: geometry)
                Image(systemName: favorited ? "heart.fill" : "heart")
                    .font(.system(size: 50))
                    .foregroundColor( favorited ? Color(.petmaroon) : Color(.petmaroon))
                    .frame(minWidth: 50, maxWidth: 50, minHeight: 50, maxHeight: 50)
                    .onTapGesture {
                        $favorited.wrappedValue.toggle()
                    }
                Spacer(minLength: 25)

            }
        }
    }
}

struct HeaderTitle: View {
    @Binding var zoomed: Bool
    var geometry: GeometryProxy
    let animalName: String?
    let animalType: String?

    let animal: AnimalEntity

    init(animal: AnimalEntity, zoomed: Binding<Bool>, geometry: GeometryProxy) {
        self.animal = animal
        self.animalType = animal.type
        self.animalName = animal.name
        self._zoomed = zoomed
        self.geometry = geometry
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(animalName ?? "Default Name")
                .font(.largeTitle)
                .frame(maxWidth: .infinity, alignment: zoomed ? .center : .leading)
            Text("\(animal.breed) \(animalType ?? "")")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: zoomed ? .center : .leading)
        }
        .offset(
            x: zoomed ? 0 : 0,
            y: zoomed ? geometry.frame(in: .local).midY : 0
        )

        .animation(.spring(), value: zoomed)
    }
}

struct HeaderTitle_Previews: PreviewProvider {
    static var previews: some View {
        if let animal = CoreDataHelper.getTestAnimalEntity() {
            Group {
                GeometryReader { geometry in
                    HeaderTitle(animal: animal, zoomed: .constant(true), geometry: geometry)
                }
                .frame(width: 200, height: 150)

                GeometryReader { geometry in
                    HeaderTitle(animal: animal, zoomed: .constant(false), geometry: geometry)
                }
                .frame(width: 200, height: 100)
            }
            .previewLayout(.sizeThatFits)
        }
    }
}

#Preview {
    if let animal = CoreDataHelper.getTestAnimalEntity() {
        Group {
            GeometryReader { geometry in
                AnimalHeaderView(animal: animal,
                                 zoomed: .constant(true),
                                 favorited: .constant(false),
                                 geometry: geometry)
            }
            .frame(width: 500, height: 700)

            GeometryReader { geometry in
                AnimalHeaderView(animal: animal,
                                 zoomed: .constant(false),
                                 favorited: .constant(true),
                                 geometry: geometry)
            }
            .frame(width: 500, height: 100)
            GeometryReader { geometry in
                AnimalHeaderView(animal: animal,
                                 zoomed: .constant(false),
                                 favorited: .constant(false),
                                 geometry: geometry)
            }
            .frame(width: 500, height: 100)
        }
        .previewLayout(.sizeThatFits)
    }
}
