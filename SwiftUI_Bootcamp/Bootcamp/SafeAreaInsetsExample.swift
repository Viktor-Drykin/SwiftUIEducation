//
//  SafeAreaInsetsExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 08.04.2024.
//

import SwiftUI

struct SafeAreaInsetsExample: View {
    var body: some View {
        NavigationStack {
            List(0..<10) { _ in
                Rectangle()
                    .frame(height: 300)
            }
            .navigationTitle("Safe Area Insets")
            .safeAreaInset(edge: .top, alignment: .trailing, spacing: nil) {
                Text("Hi")
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
            }
        }
    }
}

#Preview {
    SafeAreaInsetsExample()
}
