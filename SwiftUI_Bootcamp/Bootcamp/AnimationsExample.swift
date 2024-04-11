//
//  AnimationsExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 26.01.2024.
//

import SwiftUI

struct AnimationsExample: View {

    @State var isAnimated: Bool = false

    var body: some View {
        VStack {
            Button("Button") {
                isAnimated.toggle()
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
                .fill(isAnimated ? Color.red : Color.green)
                .frame(
                    width: isAnimated ? 100 : 300,
                    height: isAnimated ? 100 : 300
                )
                .rotationEffect(.degrees(isAnimated ? 360 : 0))
                .offset(y: isAnimated ? 300 : 0)
                .animation(
                    Animation
                        .default,
                    value: isAnimated
                )
            Spacer()
        }
    }
}

#Preview {
    AnimationsExample()
}
