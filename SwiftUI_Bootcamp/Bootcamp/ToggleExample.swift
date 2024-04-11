//
//  ToggleExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct ToggleExample: View {

    @State var toggleValue = false

    var body: some View {
        VStack {

            HStack {
                Text("Status: \(String(toggleValue))")
            }

            Toggle(isOn: $toggleValue) {
                Text("Label")
            }
            .toggleStyle(.automatic)
            .tint(.red)

            Spacer()
        }
    }
}

#Preview {
    ToggleExample()
}
