//
//  FocusStateExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.02.2024.
//

import SwiftUI

struct FocusStateExample: View {

    enum TextFieldType: Hashable {
        case username
        case password
    }

    @FocusState private var focusedStateType: TextFieldType?
    @State private var username = ""

    //@FocusState private var passwordInFocus: Bool
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Placeholder", text: $username)
                .focused($focusedStateType, equals: .username)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)

            SecureField("Add your password", text: $password)
                .focused($focusedStateType, equals: .password)
                .padding(.leading)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(Color.gray.brightness(0.3))
                .cornerRadius(10)

            Button("SIGN UP") {
                let usernameIsValid = !username.isEmpty
                let passworfIsValid = !password.isEmpty
                if usernameIsValid && passworfIsValid {
                    print("sign up")
                } else if usernameIsValid {
                    focusedStateType = .password
                } else {
                    focusedStateType = .username
                }
            }

//            Button("Toggle focus state") {
//                usernameInFocus.toggle()
//            }
        }
        .padding(40)
//        .onAppear {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                usernameInFocus = true
//            }
//        }
    }
}

#Preview {
    FocusStateExample()
}
