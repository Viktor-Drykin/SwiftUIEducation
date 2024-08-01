//
//  AllignmentExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 01.08.2024.
//

import SwiftUI

struct AllignmentExample: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .background(Color.blue)
                .alignmentGuide(.leading) { dimension in
                    return dimension.width * 0.5
                }

            Text("This is some other text!")
                .background(Color.red)
        }
        .background(Color.orange)
    }
}

struct AllignmentChildView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            row(title: "Row 1")
            row(title: "Row 2")
            row(title: "Row 2")
        })
        .padding(16)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
        .padding(40)
    }

    private func row(title: String) -> some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .frame(width: 30, height: 30)
            Text(title)
            Spacer()
        }
    }
}

#Preview {
    //AllignmentChildView()
    AllignmentExample()
}
