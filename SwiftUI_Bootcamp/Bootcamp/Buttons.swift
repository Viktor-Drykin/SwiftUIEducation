//
//  Buttons.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 25.01.2024.
//

import SwiftUI

struct Buttons: View {

    @State var title: String = "This is my title"

    var body: some View {
        example1
    }

    var example1: some View {
        VStack(spacing: 20) {
            Text(title)
            Button("Press me!") {
                self.title = "Button #1 was pressed"
            }
            .accentColor(.red)

            Button(action: {
                self.title = "Button #2 was pressed"
            }, label: {
                Text("Save".uppercased())
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal, 20)
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
            })

            Button(action: {
                self.title = "Button #3 was pressed"
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 75, height: 75)
                    .shadow(radius: 10)
                    .overlay {
                        Image(systemName: "heart.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
            })

            Button(action: {
                self.title = "Button #4 was pressed"
            }, label: {
                Text("Finish".uppercased())
                    .font(.caption)
                    .bold()
                    .foregroundStyle(.gray)
                    .padding()
                    .padding(.horizontal, 10)
                    .background(
                        Capsule()
                            .stroke(Color.gray, lineWidth: 3.0)
                    )
            })
        }
    }
}

#Preview {
    Buttons()
}
