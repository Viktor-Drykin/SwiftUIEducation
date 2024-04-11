//
//  IntroView.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 10.02.2024.
//

import SwiftUI

struct IntroView: View {

    @AppStorage("signed_in") var currentUserSignedIn: Bool = false

    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]),
                center: .topLeading,
                startRadius: 5,
                endRadius: UIScreen.main.bounds.height
            )
            .ignoresSafeArea(.all)

            if currentUserSignedIn {
                ProfileView()
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            } else {
                OnboardingView()
                    .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            }
        }
    }
}

#Preview {
    IntroView()
}
