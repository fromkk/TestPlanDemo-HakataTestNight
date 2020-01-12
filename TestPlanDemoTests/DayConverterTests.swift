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
        XCTAssertEqual("1st", DayConverter.convert(day: 1, for: Locale(identifier: "en_US")))
        XCTAssertEqual("2nd", DayConverter.convert(day: 2, for: Locale(identifier: "en_US")))
        XCTAssertEqual("3rd", DayConverter.convert(day: 3, for: Locale(identifier: "en_US")))
        XCTAssertEqual("4th", DayConverter.convert(day: 4, for: Locale(identifier: "en_US")))
        XCTAssertEqual("9th", DayConverter.convert(day: 9, for: Locale(identifier: "en_US")))
        XCTAssertEqual("11th", DayConverter.convert(day: 11, for: Locale(identifier: "en_US")))
        XCTAssertEqual("12th", DayConverter.convert(day: 12, for: Locale(identifier: "en_US")))
        XCTAssertEqual("13th", DayConverter.convert(day: 13, for: Locale(identifier: "en_US")))
    }

    func testConvertJa() {
        XCTAssertEqual("1", DayConverter.convert(day: 1, for: Locale(identifier: "ja_JP")))
        XCTAssertEqual("2", DayConverter.convert(day: 2, for: Locale(identifier: "ja_JP")))
    }
}
