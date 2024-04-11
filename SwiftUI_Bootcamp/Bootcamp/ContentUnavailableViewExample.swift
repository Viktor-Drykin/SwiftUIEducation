//
//  ContentUnavailableViewExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.04.2024.
//

import SwiftUI

struct ContentUnavailableViewExample: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            ContentUnavailableView.search
            ContentUnavailableView(
                "No Internet connection",
                systemImage: "wifi.slash",
                description: Text("This is a description")
            )
        } else {
            Color.red
        }
    }
}

#Preview {
    ContentUnavailableViewExample()
}
