//
//  MultipleSheetsExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 31.07.2024.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - binding
// 2 - use multiple .sheets
// 3 - use $item

struct MultipleSheetsExample: View {

    @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
    @State var showSheet = false

    @State var showSheet2 = false

    @State var selectedModelForItems: RandomModel? = nil

    var body: some View {
        // 1 - binding
        //viewForBinding

        // 2 - use multiple .sheets
        //viewWithMultipleSheets

        // 3 - use $item
        viewWithItems
    }

    var viewWithItems: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModelForItems = .init(title: "Item \(index)")
                    }
                }
            }
            .sheet(item: $selectedModelForItems) { item in
                StaticNextScreen(selectedModel: item)
            }
        }
    }

    var viewWithMultipleSheets: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet, content: {
                StaticNextScreen(selectedModel: .init(title: "ONE"))
            })
            Button("Button 2") {
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                StaticNextScreen(selectedModel: .init(title: "TWO"))
            })
        }
    }

    var viewForBinding: some View {
        VStack(spacing: 20) {
            Button("Button 1") {
                selectedModel = .init(title: "ONE")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedModel = .init(title: "TWO")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            NextScreenWithBinding(selectedModel: $selectedModel)
        })
    }
}

struct StaticNextScreen: View {

    let selectedModel: RandomModel

    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

struct NextScreenWithBinding: View {

    @Binding var selectedModel: RandomModel

    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsExample()
}
