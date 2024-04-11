//
//  LazyGrids.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 25.01.2024.
//

import SwiftUI

struct LazyGrids: View {

    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
        GridItem(.flexible(), spacing: 6, alignment: nil),
    ]

    var body: some View {
        example1
    }

    var example1: some View {
        ScrollView {

            Rectangle()
                .fill(Color.orange)
                .frame(height: 400)

            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 6,
                      pinnedViews: [.sectionHeaders],
                      content: {

                Section(header:
                            Text("Section 1")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.blue)
                    .padding()
                ) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                }

                Section(header:
                            Text("Section 2")
                    .foregroundColor(.white)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.red)
                    .padding()
                ) {
                    ForEach(0..<20) { index in
                        Rectangle()
                            .frame(height: 150)
                    }
                }
            })
        }
    }
}

#Preview {
    LazyGrids()
}
