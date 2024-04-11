//
//  TapGestureExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 03.02.2024.
//

import SwiftUI

struct TapGestureExample: View {

    @State var isSelected = false
    @State var backgroundGestureToggle = false

    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 200)
                .foregroundColor(isSelected ? Color.green : Color.red)

            Button(action: {
                isSelected.toggle()
            }, label: {
                Text("Button")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(25)
            })

            Text("Text with gesture")
                .font(.headline)
                .foregroundColor(.white)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .cornerRadius(25)
//                .onTapGesture {
//                    isSelected.toggle()
//                }
                .onTapGesture(count: 2, perform: {
                    isSelected.toggle()
                })

            Spacer()
        }
        .padding(40)
    }
}

#Preview {
    TapGestureExample()
}
