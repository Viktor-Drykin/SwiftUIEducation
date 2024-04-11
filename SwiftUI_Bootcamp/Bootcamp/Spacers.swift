//
//  Spacers.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 23.01.2024.
//

import SwiftUI

struct Spacers: View {
    var body: some View {
        example2
    }

    var example2: some View {
        VStack {
            HStack(spacing: 0) {
                Image(systemName: "xmark")
                Spacer()
                    .frame(height: 10)
                    .background(Color.orange)
                Image.init(systemName: "gear")
            }
            .font(.title)
            //.background(Color.yellow)
            .padding(.horizontal)
            //.background(Color.blue)

            Spacer()
                .frame(width: 10)
                .background(Color.orange)

            Rectangle()
                .frame(height: 55)
        }
        //.background(Color.yellow)
    }

    var example1: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0)
                .frame(height: 10)
                .background(Color.orange)

            Rectangle()
                .frame(width: 50, height: 50)

            Spacer()
                .frame(height: 10)
                .background(Color.orange)

            Rectangle()
                .fill(Color.green)
                .frame(width: 50, height: 50)

            Spacer()
                .frame(height: 10)
                .background(Color.orange)

            Rectangle()
                .fill(Color.red)
                .frame(width: 50, height: 50)

            Spacer(minLength: 0)
                .frame(height: 10)
                .background(Color.orange)
        }
        .background(Color.yellow)
        //.padding(.horizontal, 200)
        .background(Color.blue)
    }
}

#Preview {
    Spacers()
}
