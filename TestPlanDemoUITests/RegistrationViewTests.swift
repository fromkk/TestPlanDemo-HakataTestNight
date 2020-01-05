//
//  RegistrationViewTests.swift
//  TestPlanDemoUITests
//
//  Created by Kazuya Ueoka on 2020/01/05.
//  Copyright © 2020 fromKK. All rights reserved.
//

import XCTest

final class RegistrationViewTests: XCTestCase {
    var application: XCUIApplication!
    override func setUp() {
        super.setUp()
        application = XCUIApplication()
        application.launch()
        let rootView = RootViewPageObject(application: application)
        rootView.tapRegistrationButton()
    }

    func testLabelExists() {
        let registrationView = RegistrationViewPageObject(application: application)
        XCTAssertTrue(registrationView.registerLabel.exists)
        XCTAssertTrue(registrationView.registrationLabel.exists)
    }

    func testLabelTexts() {
        let registrationView = RegistrationViewPageObject(application: application)
        XCTAssertEqual(localizedString(for: "Register"), registrationView.registerLabel.label)
        XCTAssertEqual(localizedString(for: "Registration"), registrationView.registrationLabel.label)
    }

    private func localizedString(for key: String) -> String? {
        return NSLocalizedString(key, tableName: "Localizable", bundle: Bundle(for: RegistrationViewTests.self), value: "", comment: "")
    }
}
