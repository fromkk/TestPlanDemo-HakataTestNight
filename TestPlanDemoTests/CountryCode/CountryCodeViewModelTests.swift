//
//  CountryCodeViewModelTests.swift
//  TestPlanDemoTests
//
//  Created by Kazuya Ueoka on 2020/01/04.
//  Copyright © 2020 fromKK. All rights reserved.
//

@testable import TestPlanDemo
import XCTest

final class CountryCodeViewModelTest: XCTestCase {
    func testJapan() {
        let viewModel = CountryCodeViewModel()
        viewModel.locale = Locale(identifier: "ja_JP")
        viewModel.start()
        XCTAssertEqual(viewModel.countryCode, "🇯🇵")
    }

    func testAmerica() {
        let viewModel = CountryCodeViewModel()
        viewModel.locale = Locale(identifier: "en_US")
        viewModel.start()
        XCTAssertEqual(viewModel.countryCode, "🇺🇸")
    }

    func testUnknown() {
        let viewModel = CountryCodeViewModel()
        viewModel.locale = Locale(identifier: "")
        viewModel.start()
        XCTAssertEqual(viewModel.countryCode, "unknown")
    }

    func testOthers() {
        let viewModel = CountryCodeViewModel()
        viewModel.locale = Locale(identifier: "ko_KR")
        viewModel.start()
        XCTAssertEqual(viewModel.countryCode, "not found")
    }
}
