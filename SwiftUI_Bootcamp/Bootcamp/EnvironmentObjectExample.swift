//
//  EnvironmentObjectExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 04.02.2024.
//

import SwiftUI

// ObservedObject
// StateObject
// EnvironmentObject

class EnvironmentViewModel: ObservableObject {

    @Published var dataArray: [String] = []

    init() {
        getData()
    }

    func getData() {
        dataArray.append(contentsOf: ["iPhone", "iPad", "iMac", "Apple Watch"])
    }



}

struct EnvironmentObjectExample: View {

    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.dataArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(selectedItem: item)
                    } label: {
                        Text(item)
                    }
                }
            }
            .navigationTitle("iOS devices")
        }
        .environmentObject(viewModel)
    }
}

struct DetailView: View {

    let selectedItem: String

    var body: some View {
        ZStack {
            Color.orange
                .edgesIgnoringSafeArea(.all)

            NavigationLink(destination: FinalView()) {
                Text(selectedItem)
                    .font(.headline)
                    .foregroundStyle(.orange)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
            }
        }
    }
}

struct FinalView: View {

    //@ObservedObject var viewModel: EnvironmentViewModel
    @EnvironmentObject var viewModel: EnvironmentViewModel

    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.red, Color.purple],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)

            ScrollView {
                VStack(spacing: 20) {
                    ForEach(viewModel.dataArray, id: \.self) { item in
                            Text(item)
                    }
                }
                .foregroundStyle(.white)
                .font(.largeTitle)
            }
        }
    }
}

#Preview {
    EnvironmentObjectExample()
}
