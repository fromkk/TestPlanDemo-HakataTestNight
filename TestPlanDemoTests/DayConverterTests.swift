//
//  DayConverterTests.swift
//  TestPlanDemoTests
//
//  Created by Kazuya Ueoka on 2020/01/12.
//  Copyright © 2020 fromKK. All rights reserved.
//

@testable import TestPlanDemo
import XCTest

final class DayConverterTests: XCTestCase {
    func testConvertEn() {
        XCTAssertEqual("1st", DayConverter.convert(day: 1, for: .init(identifier: "en_US")))
    }

    func testConvertJa() {
        XCTAssertEqual("1", DayConverter.convert(day: 1, for: .init(identifier: "ja_JP")))
    }
}
