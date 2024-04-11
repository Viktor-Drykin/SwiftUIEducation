//
//  ActionSheetExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 29.01.2024.
//

import SwiftUI

struct ActionSheetExample: View {

    @State var showActionSheet = false

    var body: some View {
        Button("Click me") {
            showActionSheet.toggle()
        }
        .actionSheet(isPresented: $showActionSheet, content: {
            getActionSheet()
        })
    }

    func getActionSheet() -> ActionSheet {
        ActionSheet(title: Text("Title"))
    }
}

#Preview {
    ActionSheetExample()
}
