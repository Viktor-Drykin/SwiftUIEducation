//
//  ControlGroupExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.04.2024.
//

import SwiftUI

struct ControlGroupExample: View {
    var body: some View {
        Menu("My Menu") {
            ControlGroup("One") {
                Button("1") {

                }
                Button("2") {

                }
                Menu("How are you?") {
                    Button("Good") {

                    }
                    Button("Sad") {

                    }
                }
            }
            Button("Two") {

            }
            Menu("Three") {
                Button("Hi") {

                }
                Button("Hello") {

                }
            }
        }
    }
}

#Preview {
    ControlGroupExample()
}
