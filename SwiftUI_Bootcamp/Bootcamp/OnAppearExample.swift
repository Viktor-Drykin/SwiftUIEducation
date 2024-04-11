//
//  OnAppearExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 02.02.2024.
//

import SwiftUI

struct OnAppearExample: View {

    @State var mytext = "S"
    @State var count = 0

    var body: some View {
        NavigationView {
            ScrollView {
                Text(mytext)
                LazyVStack {
                    ForEach(0..<50) { _ in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(height: 200)
                            .padding()
                            .onAppear {
                                count += 1
                            }
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
                    mytext = "This is new text"
                })
            }
            .onDisappear {
                mytext = "Ending text."
            }
            .navigationTitle("On Appear \(count)")
        }
    }
}

#Preview {
    OnAppearExample()
}
