//
//  FuturesExample.swift
//  SwiftUI_Bootcamp
//
//  Created by Viktor Drykin on 05.11.2024.
//

import SwiftUI
import Combine

class FuturesExampleViewModel: ObservableObject {
    @Published var title: String = "Starting title"
    let url = URL(string: "https://www.google.com")!
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }

    private func download() {
        //getCombinePublisher()
        getFuturePublisher()
            .sink { completion in
                print("\(completion)")
            } receiveValue: { [weak self] returnedValue in
                self?.title = returnedValue
            }
            .store(in: &cancellables)

//        getEscapingClosure { [weak self] value, error in
//            self?.title = value
//        }

    }

    func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .timeout(1, scheduler: DispatchQueue.main)
            .map { _ in
                return "New value"
            }
            .eraseToAnyPublisher()
    }

    func getEscapingClosure(completion: @escaping (_ value: String, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            completion("New value 2", nil)
        }
        .resume()
    }

    func getFuturePublisher() -> Future<String, Error> {
        return Future { [weak self] promise in
            self?.getEscapingClosure { value, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(value))
                }
            }
        }
    }
}

struct FuturesExample: View {

    @StateObject private var viewModel = FuturesExampleViewModel()

    var body: some View {
        Text(viewModel.title)
    }
}

#Preview {
    FuturesExample()
}
