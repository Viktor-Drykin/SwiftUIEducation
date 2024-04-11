//
//  NavigationExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 28.01.2024.
//

import SwiftUI

struct NavigationExample: View {
    var body: some View {
        NavigationView {
            ScrollView {

                NavigationLink("Hello world!") {
                    MyAnotherScreen()
                }

                Text("Hello there")
                Text("Hello there")
                Text("Hello there")
            }
            .navigationTitle("All inboxes")
            .toolbar(content: {
                NavigationLink(destination: MyAnotherScreen()) {
                    Image(systemName: "gear")
                }
                .tint(Color.red)
            })
//            .navigationBarTitleDisplayMode(.automatic)
//           .navigationBarBackButtonHidden(true)
        }
    }
}

struct MyAnotherScreen: View {

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ZStack {
            Color.green
                .edgesIgnoringSafeArea(.all)
                .navigationTitle("Green Screen")
                .toolbar(.hidden, for: .automatic)
                //.navigationBarBackButtonHidden(true)

            VStack {

                Button("Back button") {
                    presentationMode.wrappedValue.dismiss()
                }

                NavigationLink("Click here") {
                    Text("3rd screen")
                }
            }

        }
    }
}

#Preview {
    NavigationExample()
}
