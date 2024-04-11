//
//  ObservableExampleAfter.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 11.04.2024.
//

import SwiftUI

/// THIS IS ONLY FOR iOS 17

@Observable
fileprivate class ObservableViewModel {
    var title = "some title"
}

struct ObservableExampleAfter: View {

    @State private var viewModel = ObservableViewModel()

    var body: some View {
        VStack(spacing: 40) {
            Button(viewModel.title) {
                viewModel.title = "New Title"
            }
            SomeChildView(viewModel: viewModel)

            SomeThirdView()
        }
        .environment(viewModel)
    }
}

fileprivate struct SomeChildView: View {
    @Bindable var viewModel: ObservableViewModel

    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Some child title"
        }
    }
}

fileprivate struct SomeThirdView: View {

    @Environment(ObservableViewModel.self) var viewModel

    var body: some View {
        Button(viewModel.title) {
            viewModel.title = "Third view title"
        }
    }
}

#Preview {
    ObservableExampleAfter()
}
