//
//  RootView.swift
//  TestPlanDemo
//
//  Created by Kazuya Ueoka on 2020/01/03.
//  Copyright © 2020 fromKK. All rights reserved.
//

import SwiftUI
import UIKit

enum Menu: Int, CaseIterable, Equatable, Identifiable {
    var id: Int { return rawValue }
    case price
    case countryCode

    var title: String {
        switch self {
        case .price:
            return "Price"
        case .countryCode:
            return "Country code"
        }
    }
}

struct MenuView: View {
    let menu: Menu
    var body: some View {
        Group {
            if menu == .price {
                NavigationLink(menu.title, destination: PriceView())
            } else if menu == .countryCode {
                NavigationLink(menu.title, destination: CountryCodeView())
            } else {
                EmptyView()
            }
        }
    }
}

struct MenuListView: View {
    var body: some View {
        List(Menu.allCases) { menu in
            MenuView(menu: menu)
        }
    }
}

struct RootView: View {
    var body: some View {
        NavigationView {
            MenuListView()
        }
    }
}

@available(iOS 13.0, *)
struct RootViewView_Preview: PreviewProvider {
    static var previews: some View {
        RootView()
            .previewLayout(.sizeThatFits)
    }
}
