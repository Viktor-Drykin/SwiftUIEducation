//
//  Stacks.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 23.01.2024.
//

import SwiftUI

struct Stacks: View {
    var body: some View {
        example4
    }

    var example4: some View {
        VStack(spacing: 50) {
            ZStack {
                Circle()
                    .frame(width: 100, height: 100)

                Text("1")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }

            Text("1")
                .font(.largeTitle)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: 100, height: 100)
                )
        }
    }

    var example3: some View {
        VStack(alignment: .center) {
            Text("5")
                .font(.largeTitle)
                .foregroundColor(.gray)

            Text("Items in your cart:")
                .font(.caption)
                .underline()
        }
    }

    var zStackExample2: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 350, height: 500, alignment: .center)

            VStack(alignment: .leading, spacing: 30) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 150, height: 150)

                Rectangle()
                    .fill(Color.green)
                    .frame(width: 100, height: 100)

                HStack(alignment: .bottom) {
                    Rectangle()
                        .fill(Color.purple)
                    .frame(width: 50, height: 50)

                    Rectangle()
                        .fill(Color.pink)
                        .frame(width: 75, height: 75)

                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                }
                .background(Color.white)
            }
            .background(Color.black)
        }
    }

    var zStackExample: some View {
        ZStack(alignment: .topTrailing, content: {
            Rectangle()
                .fill(Color.red)
                .frame(width: 200, height: 200)

            Rectangle()
                .fill(Color.green)
                .frame(width: 150, height: 150)

            Rectangle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
        })
    }
}

#Preview {
    Stacks()
}
