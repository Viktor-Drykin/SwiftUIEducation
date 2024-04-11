//
//  Paddings.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 23.01.2024.
//

import SwiftUI

struct Paddings: View {
    var body: some View {
        example2
    }

    var example2: some View {
        VStack(alignment: .leading) {
            Text("Hello, World!")
                .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)

            Text("This is the descriptions of what we will do on this screen. It's a multiple lines and we will align the text to the leading edge.")
        }
        .padding()
        .padding(.vertical, 30)
        .background(
            Color.white
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0.0, y: 10)
        )
        .padding(.horizontal, 10)
    }

    var example1: some View {
        Text("Hello, World! This is fun!")
            .background(Color.yellow)
            .padding(.all, 10)
            .padding(.leading, 20) // leading padding is 30
            .background(Color.blue)
    }
}

#Preview {
    Paddings()
}
