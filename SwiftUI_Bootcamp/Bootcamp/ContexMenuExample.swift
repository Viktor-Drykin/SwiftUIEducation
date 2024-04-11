//
//  ContexMenuExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 29.01.2024.
//

import SwiftUI

struct ContexMenuExample: View {

    @State var backgroundColor = Color.orange

    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .font(.title)
            Text("SwiftUI Thinking")
                .font(.headline)
            Text("How to use context menu")
                .font(.subheadline)
            Button("Click on me") {

            }
        }
        .foregroundStyle(.white)
        .padding(30)
        .background(RoundedRectangle(cornerRadius: 30).fill(backgroundColor))
        .contextMenu(ContextMenu(menuItems: {
            Button {
                backgroundColor = .yellow
            } label: {
                Label("Button 1", systemImage: "flame.fill")
            }

            Button {
                backgroundColor = .red
            } label: {
                Text("Button 2")
            }

            Button {
                backgroundColor = .green
            } label: {
                HStack {
                    Text("Button 3")
                    Image(systemName: "heart.fill")
                }
            }

        }))
    }
}

#Preview {
    ContexMenuExample()
}
