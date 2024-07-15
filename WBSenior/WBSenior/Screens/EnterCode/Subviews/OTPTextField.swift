//
//  OTPTextField.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 08.07.2024.
//

import SwiftUI

struct OTPTextField: View {
    @FocusState 
    private var isKeyboardShowing: Bool

    @Binding 
    private var otpCode: String
    
    private let codeLength: Int
    
    init(otpCode: Binding<String>, codeLength: Int) {
        self._otpCode = otpCode
        self.codeLength = codeLength
    }
    
    var body: some View {
        ZStack {
            HStack(spacing: .digitsSpacing) {
                ForEach(0..<codeLength, id: \.self) { index in
                    let isActive = (index + 1) == otpCode.count
                    RoundedRectangle(cornerRadius: .digitsCornerRadius)
                        .strokeBorder(isActive ? Color.primaryButton : Color.clear)
                        .animation(.easeInOut(duration: .strokeAnimationDuration), value: isActive)
                        .background {
                            RoundedRectangle(cornerRadius: .digitsCornerRadius)
                                .fill(.white.opacity(.textFieldOpacity))
                        }
                        .frame(height: .textFieldHeight)
                        .overlay {
                            Text(getOtpCodeAt(index: index))
                                .font(.medium(.digitsFontSize))
                                .foregroundStyle(.white)
                        }
                }
            }
            TextField("", text: $otpCode)
                .frame(width: 0, height: 0)
                .textContentType(.oneTimeCode)
                .focused($isKeyboardShowing)
                .background(.clear)
                .foregroundStyle(.clear)
                .keyboardType(.decimalPad)
                .onChange(of: otpCode) { text in
                    otpCode = String(
                        text.filter { $0.isNumber }.prefix(codeLength)
                    )
                }
        }
        .onTapGesture {
            isKeyboardShowing.toggle()
        }
    }
    
    private func getOtpCodeAt(index: Int) -> String {
        guard otpCode.count > index else {
            return ""
        }
        
        let index = otpCode.index(otpCode.startIndex, offsetBy: index)
        return String(otpCode[index])
    }
}

private extension CGFloat {
    static let textFieldHeight: CGFloat = 80
    static let digitsSpacing: CGFloat = 24
    static let digitsCornerRadius: CGFloat = 12
    static let digitsFontSize: CGFloat = 36
}

private extension Double {
    static let textFieldOpacity: CGFloat = 0.08
    static let strokeAnimationDuration: CGFloat = 0.1
}

#Preview {
    OTPTextField(otpCode: .constant(""), codeLength: 4)
        .appBackground()
}
