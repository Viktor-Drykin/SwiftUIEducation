//
//  SliderExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct SliderExample: View {

    @State var sliderValue: Double = 3
    @State var color = Color.red

    var body: some View {
        VStack {
            Text("Rating:")
            Text(
                String(format: "%.1f", sliderValue)
            )
            .foregroundStyle(color)
            //            Slider(value: $sliderValue, in: 1...5, step: 0.5)
            //                .tint(.red)
            Slider(
                value: $sliderValue,
                in: 1...5,
                step: 1.0,
                onEditingChanged: { (_) in
                    color = .green
                },
                minimumValueLabel: 
                    Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.orange),
                maximumValueLabel: Text("5")) {
                    Text("Title")
                }
                .tint(.red)

        }
    }
}

#Preview {
    SliderExample()
}
