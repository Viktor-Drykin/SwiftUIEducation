//
//  ButtonStyleExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.02.2024.
//

import SwiftUI

struct ButtonStyleExample: View {
    var body: some View {
        VStack {
            Button("Button Title") {

            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .buttonStyle(.plain)

            Button("Button Title") {

            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.large)
            .buttonStyle(.bordered)

            Button("Button Title") {

            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.mini)
            .buttonStyle(.borderedProminent)

            Button("Button Title") {

            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .controlSize(.small)
            .buttonStyle(.borderless)
        }
        .padding()
    }
}

#Preview {
    ButtonStyleExample()
}
