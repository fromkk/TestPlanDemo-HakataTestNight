//
//  RegistrationView.swift
//  TestPlanDemo
//
//  Created by Kazuya Ueoka on 2020/01/05.
//  Copyright © 2020 fromKK. All rights reserved.
//

import SwiftUI

struct RegistrationView: View {
    var body: some View {
        VStack {
            Text("Register")
                .accessibility(identifier: "Register")
            Text("Registration")
                .accessibility(identifier: "Registration")
        }
    }
}

struct RegistrationView_Preview: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .previewLayout(.sizeThatFits)
    }
}
