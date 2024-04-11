//
//  Binding.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 26.01.2024.
//

import SwiftUI

struct BindingExample: View {

    @State var backgroundColor: Color = Color.green
    @State var title: String = "Title"

    var body: some View {
        example1
    }

    var example1: some View {
        ZStack {
            backgroundColor
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text(title)
                    .foregroundStyle(.white)

                ButtonView(backgroundColor: $backgroundColor, title: $title)
            }
        }
    }
}

struct ButtonView: View {

    @Binding var backgroundColor: Color
    @Binding var title: String
    @State var buttonColor = Color.blue

    var body: some View {
        Button(action: {
            backgroundColor = Color.orange
            buttonColor = Color.pink
            title = title + "!"
        }, label: {
            Text("Button")
                .foregroundStyle(.white)
                .padding()
                .padding(.horizontal)
                .background(buttonColor)
                .cornerRadius(10)
        })
    }
}

#Preview {
    BindingExample()
}
