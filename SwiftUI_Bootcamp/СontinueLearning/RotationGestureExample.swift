//
//  RotationGestureExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.06.2024.
//

import SwiftUI

struct RotationGestureExample: View {

    @State var angle: Angle = Angle(degrees: 0)

    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundStyle(Color.white)
            .padding(50)
            .background(Color.blue.clipShape(RoundedRectangle(cornerRadius: 10)))
            .rotationEffect(angle)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        angle = value.rotation
                    }
                    .onEnded { value in
                        withAnimation(.spring()) {
                            angle = Angle(degrees: 0)
                        }
                    }
            )
    }
}

#Preview {
    RotationGestureExample()
}
