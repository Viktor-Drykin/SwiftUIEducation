//
//  StateWrapper.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 25.01.2024.
//

import SwiftUI

struct StateWrapper: View {

    @State var backgroundColor: Color = Color.green
    @State var myTitle = "Default Title"
    @State var count = 0

    var body: some View {
        example1
    }

    var example1: some View {
        ZStack {
            //background
            backgroundColor
                .ignoresSafeArea(edges: [.all])

            //content
            VStack(spacing: 30) {
                Text(myTitle)
                    .font(.title)
                    .bold()
                
                Text("Count: \(count)")
                    .font(.headline)
                    .underline()

                HStack(spacing: 30) {
                    Button("Button 1") {
                        backgroundColor = .red
                        myTitle = "Button #1 was pressed"
                        count += 1
                    }

                    Button("Button2") {
                        backgroundColor = .purple
                        myTitle = "Button #2 was pressed"
                        count += 1
                    }
                }
            }
        }
        .foregroundColor(.white)
    }
}

#Preview {
    StateWrapper()
}
