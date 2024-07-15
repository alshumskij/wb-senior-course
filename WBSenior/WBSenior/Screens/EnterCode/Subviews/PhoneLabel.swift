//
//  PhoneLabel.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 07.07.2024.
//

import SwiftUI

struct PhoneLabel: View {
    private let phone: String = "+7 (978) 021-58-74"
    
    var body: some View {
        Text(phone)
            .foregroundStyle(.white)
            .font(.semiBold(.phoneFontSize))
            .padding(.phoneInsets)
    }
}

private extension EdgeInsets {
    static let phoneInsets = EdgeInsets(top: 16, leading: 0, bottom: 24, trailing: 0)
}

private extension CGFloat {
    static let phoneFontSize: CGFloat = 24
}

#Preview {
    PhoneLabel()
        .appBackground()
}
