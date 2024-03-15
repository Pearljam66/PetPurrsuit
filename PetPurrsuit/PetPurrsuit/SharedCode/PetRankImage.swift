//
//  PetRankImage.swift
//  PetPurrsuit
//
//  Created by Sarah Clark on 3/11/24.
//

import SwiftUI

struct PetRankImage: View {
    let index: Int

    @State var opacity: Double = 0.4
    @State var tapped = false
    @Binding var recentIndex: Int

    var body: some View {
        Image(systemName: "dog.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .opacity(opacity)
            .foregroundStyle(.petmaroon)
            .frame(width: 50, height: 50)
            .onTapGesture {
                opacity = tapped ? 0.4 : 1.0
                tapped.toggle()
                recentIndex = index
            }
            .onChange(of: recentIndex) { value in
                checkOpacity(value: value)
            }
            .onAppear {
                checkOpacity(value: recentIndex)
            }
    }

    func checkOpacity(value: Int) {
        opacity = value >= index ? 1.0 : 0.4
        tapped.toggle()
    }
}
