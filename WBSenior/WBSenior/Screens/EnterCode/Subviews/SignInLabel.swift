//
//  SignInLabel.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 06.07.2024.
//

import SwiftUI

struct SignInLabel: View {
    var body: some View {
        Text("Sign in")
            .foregroundStyle(.white)
            .font(.medium(.fontSize))
            .frame(maxWidth: .infinity)
            .frame(height: .height)
            .background(Color.primaryButton)
            .clipShape(.rect(cornerRadius: .cornerRadius))
    }
}

private extension CGFloat {
    static let fontSize: CGFloat = 16
    static let height: CGFloat = 48
    static let cornerRadius: CGFloat = 12
}

#Preview {
    SignInLabel()
}
