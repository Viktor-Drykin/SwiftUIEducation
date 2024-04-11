//
//  PickerExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct PickerExample: View {

    @State var pickerSelection: String = "1"

    var body: some View {
        VStack {
            example1
        }
    }

    var example2: some View {
        Picker(selection: .constant(1)) {
            ForEach(18..<100) { number in
                Text(String(number))
                    .font(.headline)
                    .foregroundStyle(.red)
                    .tag(String(number))
            }
        } label: {
            HStack {
                Text("Filter:")
                Text(pickerSelection)
            }
        }
    }

    var example1: some View {
        VStack {

            HStack {
                Text("Age:")
                Text(pickerSelection)
            }

            Picker(selection: $pickerSelection) {
                ForEach(18..<100) { number in
                    Text(String(number))
                        .font(.headline)
                        .foregroundStyle(.red)
                        .tag(String(number))
                }
            } label: {
                Text("Picker")
            }
            .pickerStyle(WheelPickerStyle())
            .background(Color.green)
        }
    }
}

#Preview {
    PickerExample()
}
