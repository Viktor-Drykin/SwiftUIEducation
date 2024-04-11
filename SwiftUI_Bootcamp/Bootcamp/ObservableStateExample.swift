//
//  ObservableStateExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 04.02.2024.
//

import SwiftUI

struct FruitModel: Identifiable {
    var id: String = UUID().uuidString
    let name: String
    let count: Int
}

class FruitViewModel: ObservableObject {
    @Published var fruitArray: [FruitModel] = []
    @Published var isLoading = false

    init() {
        getFruits()
    }

    func getFruits() {
        let fruit1 = FruitModel(name: "Orange", count: 1)
        let fruit2 = FruitModel(name: "Banana", count: 2)
        let fruit3 = FruitModel(name: "Watermelon", count: 88)

        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.fruitArray.append(fruit1)
            self.fruitArray.append(fruit2)
            self.fruitArray.append(fruit3)
            self.isLoading = false
        }
    }

    func deleteFruit(index: IndexSet) {
        fruitArray.remove(atOffsets: index)
    }

}

struct ObservableStateExample: View {
    //
    //    @State var fruitArray: [FruitModel] = [
    //        //.init(name: "Apples", count: 5)
    //    ]

    @StateObject var fruitViewModel: FruitViewModel = FruitViewModel()

    var body: some View {
        NavigationView {
            List {
                if fruitViewModel.isLoading {
                    ProgressView()
                } else {
                    ForEach(fruitViewModel.fruitArray) { fruit in
                        HStack {
                            Text("\(fruit.count)")
                                .foregroundStyle(.red)
                            Text(fruit.name)
                                .font(.headline)
                                .bold()
                        }
                    }
                    .onDelete(perform: fruitViewModel.deleteFruit)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Fruit list")
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: {
                                            RandomScreen(fruitViewModel: fruitViewModel)
            }, label: {
                Text("Navigate")
            })
            )
        }
    }
}

struct RandomScreen: View {

    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var fruitViewModel: FruitViewModel

    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)

            VStack {
                ForEach(fruitViewModel.fruitArray) { fruit in
                    Text(fruit.name)
                }
            }

        }
    }
}

#Preview {
    ObservableStateExample()
}
