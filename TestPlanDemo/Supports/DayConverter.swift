//
//  DayConverter.swift
//  TestPlanDemo
//
//  Created by Kazuya Ueoka on 2020/01/12.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Foundation

struct DayConverter {
    static func convert(day: Int, for locale: Locale) -> String {
        if locale.languageCode == "en" {
            let day = day
            let number = NSNumber(value: day)
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = locale
            numberFormatter.numberStyle = .ordinal
            return numberFormatter.string(from: number)!
        } else {
            return String(day)
        }
    }
}
