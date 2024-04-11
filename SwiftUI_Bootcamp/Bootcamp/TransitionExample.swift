//
//  TransitionExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 26.01.2024.
//

import SwiftUI

struct TransitionExample: View {

    @State var showView = false

    var body: some View {
        ZStack(alignment: .bottom) {
            
            VStack {
                Button("Button") {
                    withAnimation {
                        showView.toggle()
                    }
                }
                Spacer()
            }

            if showView {
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    TransitionExample()
}
