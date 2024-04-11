//
//  NavigationStackExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.02.2024.
//

import SwiftUI

struct NavigationStackExample: View {

    let fruits = [
        "Apple",
        "Orange",
        "Bananas"
    ]

    @State private var stackPath: [String] = [
    ]

    var body: some View {
        //navigationViewExample
        navigationStackExample
    }

    var navigationStackExample: some View {
        NavigationStack(path: $stackPath) {
            ScrollView {

                Button("Super Seque!") {
                    stackPath.append(contentsOf: ["Coconut", "Mango", "Watermelon"])
                }
                VStack(spacing: 40) {

                    ForEach(fruits, id: \.self) { fruit in
                        NavigationLink(value: fruit) {
                            Text(fruit)
                        }
                    }

                    ForEach(0..<10) { x in
                        NavigationLink(value: x) {
                            Text("Click me \(x)")
                        }
                    }
                }
            }
            .navigationTitle("Nav bootcamp")
            .navigationDestination(for: Int.self) { value in
                MySecondScreen(value: value)
            }
            .navigationDestination(for: String.self) { value in
                Text("Another screen \(value)")
            }

        }
    }

    var navigationViewExample: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    ForEach(0..<10) { x in
                        NavigationLink {
                            MySecondScreen(value: x)
                        } label: {
                            Text("Click me \(x)")
                        }
                    }
                }
                .navigationTitle("Nav bootcamp")
            }
        }
    }
}

struct MySecondScreen: View {

    let value: Int

    init(value: Int) {
        self.value = value
        print("init screen \(value)")
    }

    var body: some View {
        Text("Screen \(value)")
    }
}

#Preview {
    NavigationStackExample()
}
