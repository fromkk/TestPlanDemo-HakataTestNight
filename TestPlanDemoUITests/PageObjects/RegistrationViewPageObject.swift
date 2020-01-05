//
//  RegistrationViewPageObject.swift
//  TestPlanDemoUITests
//
//  Created by Kazuya Ueoka on 2020/01/05.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Foundation
import XCTest

struct RegistrationViewPageObject: PageObjectRepresentable {
    private let application: XCUIApplication
    init(application: XCUIApplication) {
        self.application = application
    }

    var registerLabel: XCUIElement {
        application.staticTexts["Register"]
    }

    var registrationLabel: XCUIElement {
        application.staticTexts["Registration"]
    }
}
