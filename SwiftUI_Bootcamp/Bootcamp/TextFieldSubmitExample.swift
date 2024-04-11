//
//  TextFieldSubmitExample.swift
//  SwiftUI_Bootcamp
//
//  Created by DataArt Viktor Drykin on 11.02.2024.
//

import SwiftUI

struct TextFieldSubmitExample: View {

    @State var text: String = ""

    var body: some View {
        VStack {
            TextField("Placeholder", text: $text)
                .submitLabel(.return)
                .onSubmit {
                    print("Something")
                }
            TextField("Placeholder", text: $text)
                .submitLabel(.done)
                .onSubmit {
                    print("Something")
                }
            TextField("Placeholder", text: $text)
                .submitLabel(.search)
                .onSubmit {
                    print("Something")
                }
            TextField("Placeholder", text: $text)
                .submitLabel(.join)
                .onSubmit {
                    print("Something")
                }
            TextField("Placeholder", text: $text)
                .submitLabel(.go)
                .onSubmit {
                    print("Something")
                }
        }
    }
}

#Preview {
    TextFieldSubmitExample()
}
