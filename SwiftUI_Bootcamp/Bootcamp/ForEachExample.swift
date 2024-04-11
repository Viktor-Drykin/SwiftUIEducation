//
//  ForEach.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 24.01.2024.
//

import SwiftUI

struct ForEachExample: View {

    let data: [String] = ["Hi", "Hello", "Hey everyone"]
    let myString: String = "Hello"

    var body: some View {
        example2
    }

    var example2: some View {
        VStack(alignment: .leading) {
            ForEach(data.indices) { index in
                Text("\(data[index]): \(index)")
            }
            ForEach(0..<100) { index in
                Circle()
                    .frame(height: 50)

            }
        }
    }

    var example1: some View {
        VStack {
            ForEach(0..<10) { index in
                HStack {
                    Circle()
                        .frame(width: 30, height: 30)
                    Text("Index is: \(index)")
                }
            }
        }
    }
}

#Preview {
    ForEachExample()
}
