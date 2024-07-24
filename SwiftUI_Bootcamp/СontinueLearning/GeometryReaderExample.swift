//
//  GeometryReaderExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.06.2024.
//

import SwiftUI

struct GeometryReaderExample: View {
    var body: some View {
        //basicExample()
        rotation3DEffectHorizontalExample()
        //rotation3DEffectVerticalExample()
    }

    private func getHorizontalPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.width / 2
        let currentX = geo.frame(in: .global).midX
        return 1.0 - (currentX / maxDistance)
    }

    private func getVerticalPercentage(geo: GeometryProxy) -> Double {
        let maxDistance = UIScreen.main.bounds.height
        let currentY = geo.frame(in: .global).minY
        return 1.0 - ((currentY + maxDistance) / maxDistance)
    }

    private func rotation3DEffectVerticalExample() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        return RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getVerticalPercentage(geo: geometry) * 40),
                                axis: (x: 1.0, y: 0.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }

    private func rotation3DEffectHorizontalExample() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getHorizontalPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        }
    }

    private func basicExample() -> some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.6666)
                Rectangle()
                    .fill(Color.blue)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview("Portrait") {
    GeometryReaderExample()
}

#Preview("Landscape", traits: .landscapeLeft) {
    GeometryReaderExample()
}
