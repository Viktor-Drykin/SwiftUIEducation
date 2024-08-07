//
//  CoreDataExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 07.08.2024.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {

    let container: NSPersistentContainer
    @Published var savedEntities: [FruitEntity] = []

    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading core data \(error)")
            } else {
                print("Successfully loaded core data!")
            }
        }
        fetchFruits()
    }

    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        do {
           savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Error during fetching \(error)")
        }
    }

    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }

    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }

    func updateFruit(_ entity: FruitEntity) {
        entity.name = "Modified \(entity.name ?? "")"
        saveData()
    }

    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch {
            print("Error during saving \(error)")
        }
    }

}

struct CoreDataExample: View {

    @StateObject var vm = CoreDataViewModel()
    @State var textFieldText = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruit here...", text: $textFieldText)
                    .padding()
                    .font(.headline)
                    .frame(height: 55)
                    .background(Color.gray)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)

                Button(action: {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundStyle(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                })
                .padding(.horizontal)

                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No name")
                            .onTapGesture {
                                vm.updateFruit(entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
    }
}

#Preview {
    CoreDataExample()
}
