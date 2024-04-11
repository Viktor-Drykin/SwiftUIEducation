//
//  ListExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 28.01.2024.
//

import SwiftUI

struct ListExample: View {

    @State var fruits: [String] = [
        "Apple",
        "Orange",
        "Banana",
        "Peach"
    ]

    @State var vegetables: [String] = [
        "Tomato",
        "Potato",
        "Carrot"
    ]

    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(fruits, id: \.self) { fruit in
                        Text(fruit)
                            .font(.caption)
                            .foregroundStyle(Color.white)
                            .padding(.vertical)

                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                    .listRowBackground(Color.blue)
                } header: {
                    HStack {
                        Text("Fruits: \(fruits.count)")
                        Image(systemName: "flame.fill")
                    }
                    .font(.headline)
                    .foregroundStyle(Color.orange)
                }

                Section {
                    ForEach(vegetables, id: \.self) { vegetable in
                        Text(vegetable)
                    }
                } header: {
                    Text("Vegetables: \(vegetables.count)")
                }
            }
            //.tint(.purple)
            .listStyle(InsetGroupedListStyle())
            .navigationTitle("Grocery List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { EditButton() }
                ToolbarItem(placement: .topBarTrailing) { addButton }
            }
        }
        .tint(.red)
    }

    var addButton: some View {
        Button("Add") {
            add()
        }
    }

    func delete(at indexSet: IndexSet) {
        fruits.remove(atOffsets: indexSet)
    }

    func move(indices: IndexSet, newOffset: Int) {
        fruits.move(fromOffsets: indices, toOffset: newOffset)
    }

    func add() {
        fruits.append("Coconut")
    }
}

#Preview {
    ListExample()
}
