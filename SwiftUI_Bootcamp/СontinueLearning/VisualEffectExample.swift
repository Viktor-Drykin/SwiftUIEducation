//
//  VisualEffectExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 01.08.2024.
//

import SwiftUI

struct VisualEffectExample: View {

    @State private var showSpacer = false

    var body: some View {
        complexExample
        //simpleExample
    }

    private var complexExample: some View {
        ScrollView {
            VStack(spacing: 30) {
                ForEach(0..<100) { index in
                    Rectangle()
                        .frame(width: 300, height: 300)
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .visualEffect { content, geometryProxy in
                            content.offset(x: geometryProxy.frame(in: .global).minY * 0.5)
                        }
                }
            }
        }
    }

    private var simpleExample: some View {
        VStack {
            Text("Hello, World! asd fas dfs adf")
                .padding()
                .background(Color.red)
                .visualEffect { content, geometry in
                    content
                        .grayscale(geometry.frame(in: .global).minY < 300 ? 1 : 0)
                }

            if showSpacer {
                Spacer()
            }

            Text("Hello, World!")
                .padding()
                .background(Color.red)
                .visualEffect { content, geometry in
                    content
                        .grayscale(geometry.size.width >= 200 ? 1 : 0)
                }
        }
        .background(Color.green)
        .animation(.easeInOut, value: showSpacer)
        .onTapGesture {
            showSpacer.toggle()
        }
    }
}

#Preview {
    VisualEffectExample()
}
