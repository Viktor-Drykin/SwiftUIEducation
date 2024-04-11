//
//  TextFieldExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 29.01.2024.
//

import SwiftUI

struct TextFieldExample: View {

    @State var textFieldText = ""
    @State var dataArray: [String] = []

    var body: some View {
        NavigationView {
            VStack {
                TextField("Placeholder...", text: $textFieldText)
                //.textFieldStyle(.roundedBorder)
                    .padding()
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundStyle(.red)
                    .font(.headline)

                Button {
                    if textIsAppropriate() {
                        saveText()
                    }
                } label: {
                    Text("Save")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(textIsAppropriate() ? Color.blue : Color.gray)
                        .cornerRadius(10)
                        .foregroundStyle(.white)
                        .font(.headline)
                }
                .disabled(!textIsAppropriate())

                ForEach(dataArray, id: \.self) { data in
                    Text(data)
                }

                Spacer()

            }
            .padding()
            .navigationTitle("TextField bootcamp")
        }
    }

    func textIsAppropriate() -> Bool {
        textFieldText.count >= 3
    }

    func saveText() {
        dataArray.append(textFieldText)
        textFieldText = ""
    }

}

#Preview {
    TextFieldExample()
}
