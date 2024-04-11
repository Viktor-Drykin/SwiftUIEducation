//
//  SheetsExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 28.01.2024.
//

import SwiftUI

struct SheetsExample: View {

    var body: some View {
        VStack {
            SheetsView()
            FullScreenView()
        }
    }
}

struct FullScreenView: View {

    @State var showFullScreen = false

    var body: some View {
        ZStack {
            Color.yellow
                .edgesIgnoringSafeArea(.all)

            VStack {
                Button(action: {
                    showFullScreen.toggle()
                }, label: {
                    Text("Show Full Screen")
                        .foregroundStyle(.red)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                })
                .fullScreenCover(isPresented: $showFullScreen, content: {
                    ThirdScreen()
                })
            }
        }
    }
}


struct SheetsView: View {

    @State var showSheet1 = false

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)

            VStack {
                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    Text("Binding sheet")
                        .foregroundStyle(.red)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                })
                .sheet(isPresented: $showSheet1, content: {
                    //DO NOT ADD CONDITIONS LOGIC
                    SecondScreen(showSheet: $showSheet1)
                })

                Button(action: {
                    showSheet1.toggle()
                }, label: {
                    Text("Environment Presentation Mode")
                        .foregroundStyle(.blue)
                        .font(.headline)
                        .padding(20)
                        .background(Color.white.cornerRadius(10))
                })
                .sheet(isPresented: $showSheet1, content: {
                    //DO NOT ADD CONDITIONS LOGIC
                    SecondScreen(showSheet: $showSheet1)
                })
            }
        }
    }
}

struct ThirdScreen: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.red
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

struct SecondScreen: View {

    @Binding var showSheet: Bool

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color.blue
                .edgesIgnoringSafeArea(.all)

            Button(action: {
                showSheet.toggle()
            }, label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding(20)
            })
        }
    }
}

#Preview {
    SheetsExample()
}
