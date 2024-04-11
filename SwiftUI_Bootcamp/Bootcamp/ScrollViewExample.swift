//
//  ScrollViewExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 24.01.2024.
//

import SwiftUI

struct ScrollViewExample: View {
    var body: some View {
        example2
    }

    var example2: some View {
        ScrollView {
            LazyVStack {
                ForEach(0..<1000) { index in
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        LazyHStack {
                            ForEach(0..<200) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(Color.white)
                                    .frame(width: 200, height: 150)
                                    .shadow(radius: 10)
                                    .padding()
                            }
                        }
                    })
                }
            }
        }
    }

    var example1: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<50) { index in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 300, height: 300)
                }
            }
        }
    }
}

#Preview {
    ScrollViewExample()
}
