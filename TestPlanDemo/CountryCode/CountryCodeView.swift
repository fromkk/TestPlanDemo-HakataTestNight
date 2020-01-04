//
//  CountryCodeView.swift
//  TestPlanDemo
//
//  Created by Kazuya Ueoka on 2020/01/04.
//  Copyright © 2020 fromKK. All rights reserved.
//

import Combine
import SwiftUI

struct CountryCodeEntity: Codable, Equatable {
    enum Errors: Error {
        case notFound
    }

    let countryCodes: [String: String]
    static func load() throws -> CountryCodeEntity {
        let bundle = Bundle.main
        guard let url = bundle.url(forResource: "CountryCode", withExtension: "plist") else {
            throw Errors.notFound
        }
        let data = try Data(contentsOf: url)
        let plistDecoder = PropertyListDecoder()
        return try plistDecoder.decode(Self.self, from: data)
    }
}

final class CountryCodeViewModel: ObservableObject {
    var locale: Locale = .current
    @Published var countryCode: String?
    @Published var error: Error?
    func start() {
        do {
            let entity = try CountryCodeEntity.load()
            guard let regionCode = locale.regionCode else {
                countryCode = "unknown"
                return
            }
            if let countryCode = entity.countryCodes[regionCode] {
                self.countryCode = countryCode
            } else {
                countryCode = "not found"
            }
        } catch {
            self.error = error
        }
    }
}

struct CountryCodeView: View {
    @ObservedObject var viewModel: CountryCodeViewModel = .init()

    var body: some View {
        VStack {
            if viewModel.error != nil {
                Text("error")
            } else if viewModel.countryCode == nil {
                Text("loading")
            } else {
                Text(viewModel.countryCode!)
            }
        }.onAppear {
            self.viewModel.start()
        }
    }
}

struct CountryCodeView_Preview: PreviewProvider {
    static var previews: some View {
        CountryCodeView()
            .previewLayout(.sizeThatFits)
    }
}
