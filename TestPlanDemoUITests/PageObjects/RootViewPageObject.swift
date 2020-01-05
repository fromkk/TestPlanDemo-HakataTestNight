//
//  RootViewPageObject.swift
//  TestPlanDemoUITests
//
//  Created by Kazuya Ueoka on 2020/01/05.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Foundation
import XCTest

struct RootViewPageObject: PageObjectRepresentable {
    private let application: XCUIApplication
    init(application: XCUIApplication) {
        self.application = application
    }

    var priceButton: XCUIElement {
        application.buttons["Price"]
    }

    func tapPrice() {
        priceButton.tap()
    }

    var countryCodeButton: XCUIElement {
        application.buttons["Country Code"]
    }

    func tapCountryCode() {
        countryCodeButton.tap()
    }

    var registrationButton: XCUIElement {
        application.buttons["Registration"]
    }

    func tapRegistrationButton() {
        registrationButton.tap()
    }
}
