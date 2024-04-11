//
//  SafeArea.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 25.01.2024.
//

import SwiftUI

struct SafeArea: View {
    var body: some View {
        example2
    }

    var example2: some View {

            ScrollView {
                Text("Title goes here")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .leading)

                ForEach(0..<10) { index in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .frame(height: 150)
                        .shadow(radius: 10)
                        .padding(20)

                }
            }
            .background(Color.blue)
            .background(
                Color.red
                    .ignoresSafeArea(edges: .top)
            )
    }

    var example1: some View {
        ZStack {
            
            // background

            Color.blue
                .edgesIgnoringSafeArea(.all)


            // foreground
            VStack {
                Text("Hello, World!")
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.red)
        }
    }
}

#Preview {
    SafeArea()
}
