//
//  EnterCodeScreen.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 01.07.2024.
//

import SwiftUI

struct EnterCodeScreen: View {
    var body: some View {
        VStack(spacing: .spacing) {
            EnterCodeView()
            Button(action: {}, label: { GoBackLabel() })
        }
        .hideKeyboardOnTap()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .appBackground()
        .ignoresSafeArea()
    }
}

private extension CGFloat {
    static let spacing: CGFloat = 20
}

#Preview {
    EnterCodeScreen()
}
