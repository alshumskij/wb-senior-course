//
//  EnterCodeView.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 01.07.2024.
//

import SwiftUI
import Combine

struct EnterCodeView: View {
    @State
    private var otpCode: String = ""
    
    private let timer = Timer.publish(every: .second, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: .zero) {
            Image.mail
            PhoneLabel()
            OTPTextField(otpCode: $otpCode, codeLength: .codeLength)
            RequestAgainLabel(timer: timer)
            Button(action: {}, label: { SignInLabel() })
                .disabled(otpCode.count < .codeLength, withOpacity: .disableButtonOpacity)
        }
        .frame(maxWidth: .maxWidth)
        .padding(.contentInsets)
        .modalBackground()
        .padding(.horizontal, .horizontalInsets)
    }
}

private extension EdgeInsets {
    static let contentInsets = EdgeInsets(top: 40, leading: 24, bottom: 48, trailing: 24)
}

private extension CGFloat {
    static let horizontalInsets: CGFloat = 30
    static let maxWidth: CGFloat = 400
}

private extension Double {
    static let second: TimeInterval = 1
    static let disableButtonOpacity: CGFloat = 0.4
}

private extension Int {
    static let codeLength: Int = 4
}

#Preview {
    EnterCodeView()
}
