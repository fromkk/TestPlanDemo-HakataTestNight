//
//  PriceRepositorySpy.swift
//  TestPlanDemoTests
//
//  Created by Kazuya Ueoka on 2020/01/04.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Combine
@testable import TestPlanDemo

final class PriceRepositorySpy: PriceRepositoryProtocol {
    var invokedPriceSetter = false
    var invokedPriceSetterCount = 0
    var invokedPrice: PassthroughSubject<String, Never>?
    var invokedPriceList = [PassthroughSubject<String, Never>]()
    var invokedPriceGetter = false
    var invokedPriceGetterCount = 0
    var stubbedPrice: PassthroughSubject<String, Never>!
    var price: PassthroughSubject<String, Never> {
        set {
            invokedPriceSetter = true
            invokedPriceSetterCount += 1
            invokedPrice = newValue
            invokedPriceList.append(newValue)
        }
        get {
            invokedPriceGetter = true
            invokedPriceGetterCount += 1
            return stubbedPrice
        }
    }

    var invokedFetch = false
    var invokedFetchCount = 0
    func fetch() {
        invokedFetch = true
        invokedFetchCount += 1
    }
}
