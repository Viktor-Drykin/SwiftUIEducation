//
//  TextEditorExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct TextEditorExample: View {

    @State var textEditorText = "Start Text"
    @State var savedText = ""

    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $textEditorText)
                    .frame(height: 250)
                    //.foregroundColor(.red)
                    .colorMultiply(.red)
                Button {
                    savedText = textEditorText
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(30)
                }
                Text(savedText)
                Spacer()
            }
            .padding()
            .background(Color.green)
            .navigationTitle("Text editor bootcamp")
        }
    }
}

#Preview {
    TextEditorExample()
}
