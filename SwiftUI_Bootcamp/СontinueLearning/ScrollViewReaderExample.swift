//
//  ScrollViewReaderExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.06.2024.
//

import SwiftUI

struct ScrollViewReaderExample: View {

    @State var scrollToIndex: Int = 0
    @State var textFieldText: String = ""

    var body: some View {
        VStack {
            TextField("Enter a number here", text: $textFieldText)
                .frame(height: 55)
                .border(Color.gray)
                .padding(.horizontal)
                .keyboardType(.numberPad)

            Button("Scroll now") {
                    if let index = Int(textFieldText) {
                        scrollToIndex = index
                    }
            }

            ScrollView {
                ScrollViewReader(content: { proxy in

                    ForEach(0..<50) { index in
                        Text("This is item #\(index)")
                            .font(.headline)
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(radius: 10)
                            .padding()
                            .id(index)
                    }
                    .onChange(of: scrollToIndex) { oldValue, newValue in
                        withAnimation(.spring()) {
                            proxy.scrollTo(newValue, anchor: .top)
                        }
                    }
                })
            }
        }
    }
}

#Preview {
    ScrollViewReaderExample()
}
