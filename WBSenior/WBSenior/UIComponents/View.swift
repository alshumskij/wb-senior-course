//
//  Background.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 01.07.2024.
//

import SwiftUI

extension View {
    func disabled(_ condition: Bool, withOpacity opacity: Double) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? opacity : 1)
    }
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

extension View {
    func appBackground() -> some View {
        self
            .background(
                Image.background
                    .resizable()
                    .scaledToFill()
                    .background(Color.black)
            )
    }
    
    func modalBackground() -> some View {
        self
            .background(LinearGradient.modalBackground)
            .clipShape(.rect(cornerRadius: .cornerRadius))
    }
}

extension View {
    func hideKeyboardOnTap() -> some View {
        ModifiedContent(content: self, modifier: HideKeyboardOnTapModifier())
    }
    
    func endEditing() {
        HideKeyboardOnTapModifier.hideKeyboard()
    }
}

private struct HideKeyboardOnTapModifier: ViewModifier {
    static func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .fill(.clear)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .contentShape(Rectangle())
                .onTapGesture {}
                .onLongPressGesture(
                    pressing: { isPressed in
                        guard isPressed else { return }
                        Self.hideKeyboard()
                    },
                    perform: {}
                )
            content
        }
    }
}

private extension CGFloat {
    static let cornerRadius: CGFloat = 28
}
