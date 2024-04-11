//
//  ObservableExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.04.2024.
//

import SwiftUI

fileprivate class ObservableViewModel: ObservableObject {
    @Published var title = "some title"
}

struct ObservableExampleBefore: View {

    @StateObject private var viewModel = ObservableViewModel()

    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "New Title"
            }
            SomeChildView(viewModel: viewModel)

            SomeThirdView()
        }
        .environmentObject(viewModel)
    }
}

fileprivate struct SomeChildView: View {
    @ObservedObject var viewModel: ObservableViewModel

    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Some child title"
        }
    }
}

fileprivate struct SomeThirdView: View {

    @EnvironmentObject var viewModel: ObservableViewModel

    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third view title"
        }
    }
}

#Preview {
    ObservableExampleBefore()
}
