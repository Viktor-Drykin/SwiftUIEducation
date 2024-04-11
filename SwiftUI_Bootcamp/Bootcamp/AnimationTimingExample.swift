//
//  AnimationTimingExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 26.01.2024.
//

import SwiftUI

struct AnimationTimingExample: View {

    // example 1
    @State var isAnimating: Bool = false
    let timing: TimeInterval = 10

    //example 2
    @State var isAnimating2: Bool = false
    let timing2: TimeInterval = 10

    var body: some View {
        example2
    }

    var example2: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(
                    .spring(
                        response: 0.5,
                        dampingFraction: 0.7,
                        blendDuration: 1.0
                    ),
                    value: isAnimating)
        }
    }

    var example1: some View {
        VStack {
            Button("Button") {
                isAnimating.toggle()
            }

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.default, value: isAnimating)

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.linear(duration: timing), value: isAnimating)

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeIn(duration: timing), value: isAnimating)

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeOut(duration: timing), value: isAnimating)

            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350 : 50, height: 100)
                .animation(Animation.easeInOut(duration: timing), value: isAnimating)
        }
    }
}

#Preview {
    AnimationTimingExample()
}
