//
//  BackgroundsAndOverlays.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 22.01.2024.
//

import SwiftUI

struct BackgroundsAndOverlays: View {

    enum Example {
        case background
        case overlay1
        case overlay2
        case allTogether
    }

    let example: Example

    var body: some View {

        switch example {
        case .background:
            backroundExampleView
        case .overlay1:
            overlayExampleView1
        case .overlay2:
            overlayExampleView2
        case .allTogether:
            finalExample
        }
    }

    var finalExample: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background(
                Circle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.purple, Color.blue]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .shadow(color: .gray, radius: 10, x: 0.0, y: 10)
                    .overlay(
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 35, height: 35)
                            .overlay(
                                Text("5")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            )
                            .shadow(color: .gray, radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing)
            )
    }

    var overlayExampleView2: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .overlay(
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 50, height: 50)
                , alignment: .topLeading
            )
            .background(
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)
                , alignment: .topLeading
            )
    }

    var overlayExampleView1: some View {
        Circle()
            .fill(Color.pink)
            .frame(width: 100, height: 100, alignment: .center)
            .overlay(
                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            )
            .background(
                Circle()
                    .fill(Color.purple)
                    .frame(width: 110, height: 110)
            )
    }

    var backroundExampleView: some View {
        Text("Hello, World!")
            .background(
                //Color.red
                //LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing)
                //LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing)
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: 100, height: 100, alignment: .center)
            )
            .background(
                Circle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.red]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: 120, height: 120, alignment: .center)
            )
    }
}

#Preview("Backgrounds and Overlays: background") {
        BackgroundsAndOverlays(example: .background)
}

#Preview("Backgrounds and Overlays: overlay 1") {
        BackgroundsAndOverlays(example: .overlay1)
}

#Preview("Backgrounds and Overlays: overlay 2") {
        BackgroundsAndOverlays(example: .overlay2)
}

#Preview("Backgrounds and Overlays: Final") {
        BackgroundsAndOverlays(example: .allTogether)
}
