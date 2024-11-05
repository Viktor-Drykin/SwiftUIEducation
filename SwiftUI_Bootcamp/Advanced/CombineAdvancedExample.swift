//
//  CombineAdvancedExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 04.11.2024.
//

import SwiftUI
import Combine

//@Published == CurrentValueSubject

class AdvancedCombineDataService {

    //@Published var basicPublisher: String = ""
    //let currentValuePublisher = CurrentValueSubject<String, Never>("First value")
    let passthroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()

    init() {
        publishFakeData()
    }

    private func publishFakeData() {
        let intItems: [Int] = [0,1,2,3,4,4,5,4,6,7,8,9,10]
        for (index, item) in intItems.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index)) {
                //self.basicPublisher = item
                //self.currentValuePublisher.send(item)
                self.passthroughPublisher.send(item)
                if (5...7).contains(index) {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                } else {
                    self.boolPublisher.send(false)
                }

                if index == intItems.indices.last {
                    self.passthroughPublisher.send(completion: .finished)
                }
            }
        }
    }
}

class AdvancedCombineViewModel: ObservableObject {

    @Published var data: [String] = []
    // not injected because we are just studying Combine
    let dataService = AdvancedCombineDataService()
    var cancellables = Set<AnyCancellable>()

    init() {
        addSubscribers()
    }

    private func addSubscribers() {
// SEQUENCE OPERATIONS
            // will get first element and finish the subscription then FINISHED
            //.first()

            // will wait the first which matches requirement and finish the subscription then FINISHED
            //.first(where: { $0 > 4 })

            // can throw error or finish when first requirement is matched then FINISHED
//            .tryFirst(where: { int in
//                if int == 3 { throw URLError(.badURL) }
//                return int > 1
//            })
        
            // return last before completion or failure then FINISHED
            //.last()
            //.last(where: { $0 < 4 })
//            .tryLast(where: { int in
//                if int == 3 { throw URLError(.badURL) }
//                return int > 1
//            })

            // will exclude N values from the events then FINISHED
            //.dropFirst()
            //.drop(while: { $0 < 5 })
//            .tryDrop(while: { int in
//                if int == 5 { throw URLError(.badURL) }
//                return int < 6
//            })

            // take first N elements then FINISHED
            //.prefix(4)
            //.prefix(while: { $0 < 5 })
            //.tryPrefix(while: { int in  })

            // element at position then FINISHED
            //.output(at: 5)
            //.output(in: 2..<4)

// MATHEMATIC OPERATIONS
            // gives maximum, but we need to finish publisher before get a result
            //.max()
            //.max(by: { $0 < $1 })
//            .tryMap({ int in
//                if int == 5 { throw URLError(.badURL) }
//                return int
//            })
            //.min()
            //.min(by:)
            //.tryMin(by:)

// FILTERING / REDUCING OPERATIONS
            //.map { String($0) }
            //.tryMap(
            //.compactMap(
            //.tryCompactMap
            //.filter
            //.tryFilter
            //.removeDuplicates(
            //.removeDuplicates(by:)
            //.tryRemoveDuplicates(by:)
            //.replaceNil(with: 99)
            //.replaceEmpty(with:)
            //.replaceError(with: 666)
//            .scan(0, { existingSumValue, newValue in
//                return existingSumValue + newValue
//            })
            //.tryScan(,)
        // The same as scan but WAITS TILL THE FINISH
//            .reduce(0, { existingSumValue, newValue in
//                return existingSumValue + newValue
//            })
        // RETURNS FINISHED ARRAY
            //.collect()
            //.collect(3) -> RETURNS EVERY N ELEMENTS
            //.allSatisfy() -> RETURNS TRUE OR FALSE
            //.tryAllSatisfy()
// TIMING OPERATIONS
            //.debounce(for: 1, scheduler: DispatchQueue.main)
            //.delay(for: 2, scheduler: DispatchQueue.main)
            //.measureInterval(using: DispatchQueue.main)
            //.throttle(for: 3, scheduler: DispatchQueue.main, latest: true)
            //.timeout(0.75, scheduler: DispatchQueue.main)
            //.retry(3)
// MULTIPLE PUBLISHERS / SUBSCRIBERS
            //.combineLatest(dataService.boolPublisher, dataService.intPublisher)
            //.compactMap({ $1 ? String($0) : nil })
//            .compactMap({ (int1, bool, int2) in
//                if bool {
//                    String(int1)
//                } else {
//                    "n/a"
//                }
//            })
            //.removeDuplicates()
            //.merge(with: dataService.intPublisher)

//            .zip(dataService.boolPublisher, dataService.intPublisher)
//            .map { tuple in
//                return String(tuple.0) + tuple.1.description + String(tuple.2)
//            }

//            .tryMap({ int in
//                if int == 5 { throw URLError(.badURL) }
//                return int
//            })
//            .catch({ error in
//                return self.dataService.intPublisher
//            })
        //.share()
        //.multicast(subject: { PassthroughSubject<String, Error>() })

        dataService.passthroughPublisher
            .map { String($0) }
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    self?.data.append("Finihed")
                case .failure(let error):
                    self?.data.append("Error: \(error.localizedDescription)")
                }
            } receiveValue: { [weak self] returnedValue in
                self?.data.append(returnedValue)
            }
            .store(in: &cancellables)
    }

}

struct CombineAdvancedExample: View {

    @StateObject private var viewModel: AdvancedCombineViewModel = AdvancedCombineViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 5) {
                ForEach(viewModel.data, id: \.self) { item in
                    Text(item)
                        .padding(.horizontal, 5)
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .background(Color.blue)
                }
            }
        }
    }
}

#Preview {
    CombineAdvancedExample()
}
