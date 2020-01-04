//
//  CountryCodeEntityTests.swift
//  TestPlanDemoTests
//
//  Created by Kazuya Ueoka on 2020/01/04.
//  Copyright © 2020 fromKK. All rights reserved.
//

@testable import TestPlanDemo
import XCTest

final class CountryCodeEntityTests: XCTestCase {
    func testLoad() {
        do {
            let entity = try CountryCodeEntity.load()
            XCTAssertEqual(CountryCodeEntity(countryCodes: ["JP": "🇯🇵", "US": "🇺🇸"]), entity)
        } catch {
            XCTFail("CountryCodeEntity.load() failed with \(error)")
        }
    }
}
