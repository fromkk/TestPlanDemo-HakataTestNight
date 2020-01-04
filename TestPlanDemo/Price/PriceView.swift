//
//  PriceView.swift
//  TestPlanDemo
//
//  Created by Kazuya Ueoka on 2020/01/03.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Combine
import SwiftUI

protocol PriceRepositoryProtocol {
    var price: PassthroughSubject<String, Never> { get set }
    func fetch()
}

final class PriceRepository: PriceRepositoryProtocol {
    var locale: Locale = .current
    var price: PassthroughSubject<String, Never> = .init()
    func fetch() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            let result: String
            if self.locale.regionCode == "JP" {
                result = "¥1,000"
            } else if self.locale.regionCode == "US" {
                result = "$10"
            } else {
                result = "unknown"
            }
            self.price.send(result)
        }
    }
}

final class PriceViewModel: ObservableObject {
    private var cancellables: [AnyCancellable] = []
    let repository: PriceRepositoryProtocol
    init(repository: PriceRepositoryProtocol) {
        self.repository = repository
        bind()
    }

    private func bind() {
        repository.price.sink { [weak self] in self?.price = $0 }.store(in: &cancellables)
    }

    func start() {
        repository.fetch()
    }

    @Published var price: String?
}

struct PriceView: View {
    @ObservedObject var viewModel: PriceViewModel = .init(repository: PriceRepository())

    var body: some View {
        VStack {
            if viewModel.price == nil {
                Text("Loading")
            } else {
                Text(viewModel.price!)
            }
        }.onAppear {
            self.viewModel.start()
        }
    }
}

final class PriceRepositorySpy: PriceRepositoryProtocol {
    var stubbedPrice: String
    init(price: String) {
        stubbedPrice = price
    }

    var price: PassthroughSubject<String, Never> = .init()
    func fetch() {
        price.send(stubbedPrice)
    }
}

struct PriceView_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(["￥1,000", "$10", "€10"]) { price in
            PriceView(viewModel: PriceViewModel(repository: PriceRepositorySpy(price: price)))
        }
    }
}
