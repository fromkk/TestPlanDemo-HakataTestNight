//
//  PriceViewModelTests.swift
//  TestPlanDemoTests
//
//  Created by Kazuya Ueoka on 2020/01/04.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Combine
@testable import TestPlanDemo
import XCTest

final class PriceViewModelTests: XCTestCase {
    func testStart() {
        let repository = PriceRepositorySpy()
        repository.stubbedPrice = PassthroughSubject<String, Never>()
        let viewModel = PriceViewModel(repository: repository)
        XCTAssertFalse(repository.invokedFetch)
        viewModel.start()
        XCTAssertTrue(repository.invokedFetch)
    }
}
