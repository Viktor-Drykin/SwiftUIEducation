//
//  PopoverExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 28.01.2024.
//

// sheets
// animations
// transitions

import SwiftUI

struct PopoverExample: View {

    @State var showNewScreen = false

    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)

            VStack {

                //  ------  Method 1 - sheet
                Button("show sheet") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                .sheet(isPresented: $showNewScreen, content: {
                    NewScreen(showNewScreen: $showNewScreen)
                })



                // ------  Method 2 - animation offset
                Button("Show with animation") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                NewScreen(showNewScreen: $showNewScreen)
                    .padding(.top, 100)
                    .offset(y: showNewScreen ? 0 : UIScreen.main.bounds.height)
                    .animation(.spring(), value: showNewScreen)



                // ------  Method 3 - transition
                Button("Show Transition") {
                    showNewScreen.toggle()
                }
                .font(.largeTitle)
                .offset(y: -600)
                ZStack {
                    if showNewScreen {
                        NewScreen(showNewScreen: $showNewScreen)
                            .padding(.top, 100)
                            .transition(.move(edge: .bottom))
                            .animation(.spring())
                    }
                }
                .zIndex(2.0)
            }
        }
    }
}

struct NewScreen: View {

    //@Environment(\.presentationMode) var presentationMode
    @Binding var showNewScreen: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.purple
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                //presentationMode.wrappedValue.dismiss()
                showNewScreen.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

#Preview {
    PopoverExample()
}
