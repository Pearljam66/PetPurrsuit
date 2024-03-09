//
//  OnboardingView.swift
//  PetPurrsuitOnboarding
//
//  Created by Sarah Clark on 3/9/24.
//

import SwiftUI

struct OnboardingView: View {
    let onboarding: OnboardingModel

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12, style: .circular)
                .fill(.white)
                .shadow(radius: 12)
                .padding(.horizontal, 20)
            VStack(alignment: .center) {
                VStack {
                    Text(onboarding.title)
                        .foregroundStyle(Color.sarahDark)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                    Text(onboarding.description)
                        .foregroundStyle(Color.sarahDark)
                        .multilineTextAlignment(.center)
                        .padding([.top, .bottom], 10)
                        .padding(.horizontal, 10)

                    onboarding.image
                        .resizable()
                        .frame(width: 140, height: 140, alignment: .center)
                        .foregroundStyle(Color.sarahDark)
                        .aspectRatio(contentMode: .fit)
                }
                .padding()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            OnboardingView(onboarding: OnboardingModel(
                title: "Welcome to PetPurrsuit",
                description: "Looking for a Pet? Then you're in the right place",
                image: .bird)
            )
        }
    }
}
