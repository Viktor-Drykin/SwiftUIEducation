//
//  StepperExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 30.01.2024.
//

import SwiftUI

struct StepperExample: View {

    @State var stepperValue: Int = 10
    @State var widthIncrement: CGFloat = 0

    var body: some View {
        VStack {
            Stepper("Stepper: \(stepperValue)", value: $stepperValue)
                .padding(50)

            RoundedRectangle(cornerRadius: 25)
                .frame(width: 100 + widthIncrement,
                       height: 100 + widthIncrement)
            Spacer()
            Stepper("Stepper2: \(stepperValue)") {
                // increment
                incrementWidth(amount: 10)
            } onDecrement: {
                // dectement
                incrementWidth(amount: -10)
            }

        }
    }

    func incrementWidth(amount: CGFloat) {
        withAnimation(.easeInOut) {
            widthIncrement += amount
        }
    }
}

#Preview {
    StepperExample()
}
