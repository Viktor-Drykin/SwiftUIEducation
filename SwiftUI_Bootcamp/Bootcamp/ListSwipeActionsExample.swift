//
//  ListSwipeActionsExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.02.2024.
//

import SwiftUI

struct ListSwipeActionsExample: View {

    @State var fruits = [
        "apple",
    "orange",
        "banana",
        "peach"
    ]

    var body: some View {
        List {
            ForEach(fruits, id: \.self) {
                Text($0)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                        Button("Archive") {

                        }
                        .tint(.green)
                        Button("Save") {

                        }
                        .tint(.blue)
                        Button("Junk") {

                        }
                        .tint(.black)
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button("Share") {

                        }
                        .tint(.yellow)
                    }
            }
            //.onDelete(perform: delete)
        }
    }

    func delete(indexSet: IndexSet) {

    }
}

#Preview {
    ListSwipeActionsExample()
}
