//
//  MaskModifierExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 31.07.2024.
//

import SwiftUI

struct MaskModifierExample: View {

    @State var rating: Int = 0

    var body: some View {
        ZStack {
            starsView
                .overlay(
                    overlayView
                        .mask(starsView)
                )
        }
    }

    private var overlayView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    //.foregroundStyle(Color.yellow)
                    .fill(LinearGradient(colors: [Color.red, Color.blue], startPoint: .leading, endPoint: .trailing))
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
        }
        .allowsHitTesting(false)
    }

    private var starsView: some View {
        HStack {
            ForEach(1..<6) { index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundStyle(Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            rating = index
                        }
                    }
            }
        }
    }
}

#Preview {
    MaskModifierExample()
}
