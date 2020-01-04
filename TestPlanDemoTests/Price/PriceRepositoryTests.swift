//
//  PriceRepositoryTests.swift
//  TestPlanDemoTests
//
//  Created by Kazuya Ueoka on 2020/01/04.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Combine
@testable import TestPlanDemo
import XCTest

final class PriceRepositoryTests: XCTestCase {
    var cancellables: [AnyCancellable] = []
    func testFetchJapan() {
        let repository = PriceRepository()
        repository.locale = .init(identifier: "ja_JP")
        let expectation = self.expectation(description: "wait async")
        repository.price.sink { price in
            XCTAssertEqual("¥1,000", price)
            expectation.fulfill()
        }.store(in: &cancellables)
        repository.fetch()
        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchAmerica() {
        let repository = PriceRepository()
        repository.locale = .init(identifier: "en_US")
        let expectation = self.expectation(description: "wait async")
        repository.price.sink { price in
            XCTAssertEqual("$10", price)
            expectation.fulfill()
        }.store(in: &cancellables)
        repository.fetch()
        wait(for: [expectation], timeout: 2.0)
    }

    func testFetchOthers() {
        let repository = PriceRepository()
        repository.locale = .init(identifier: "ko_KR")
        let expectation = self.expectation(description: "wait async")
        repository.price.sink { price in
            XCTAssertEqual("unknown", price)
            expectation.fulfill()
        }.store(in: &cancellables)
        repository.fetch()
        wait(for: [expectation], timeout: 2.0)
    }
}
