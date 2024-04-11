//
//  TextSelectionExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.02.2024.
//

import SwiftUI

struct TextSelectionExample: View {
    var body: some View {
        VStack(spacing: 50) {
            Text("Hello, World!")
            Text("Bye, World!")

        }
        .textSelection(.enabled)
    }
}

#Preview {
    TextSelectionExample()
}
