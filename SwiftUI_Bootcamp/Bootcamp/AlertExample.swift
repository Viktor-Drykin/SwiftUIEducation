//
//  AlertExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 29.01.2024.
//

import SwiftUI

struct AlertExample: View {

    @State var showAlert = false
    @State var backgroundColor = Color.yellow
    @State var alertTitle = ""
    @State var alertMessage = ""

    var body: some View {
        ZStack {

            backgroundColor
                .edgesIgnoringSafeArea(.all)

            VStack {
                Button("Button 1") {
                    alertTitle = "Error uploading"
                    alertMessage = "Error message"
                    showAlert.toggle()
                }
                Button("Button 2") {
                    alertTitle = "Error uploading 2"
                    alertMessage = "Error message 2"
                    showAlert.toggle()
                }
            }
            .alert(isPresented: $showAlert, content: {
                getAlert2()
            })
        }
    }

    func getAlert2() -> Alert {
        return Alert(
            title: Text(alertTitle),
            message: Text(alertMessage),
            dismissButton: .default(Text("Ok"))
        )
    }

    func getAlert() -> Alert {
        Alert(title: Text("This is the title"),
              message: Text("Hre we will describe an error"),
              primaryButton: .destructive(Text("Delete"), action: {
            backgroundColor = .red
        }),
              secondaryButton: .cancel())
    }
}

#Preview {
    AlertExample()
}
