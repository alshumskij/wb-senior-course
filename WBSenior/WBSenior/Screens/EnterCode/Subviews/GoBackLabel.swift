//
//  GoBackLabel.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 03.07.2024.
//

import SwiftUI

struct GoBackLabel: View {
    var body: some View {
        HStack(spacing: .spacing) {
            Image.chevronDown
            Text("Go back")
                .foregroundStyle(.white)
                .font(.regular(.fontSize))
                .padding(.vertical, .verticalPadding)
        }
    }
}

private extension CGFloat {
    static let fontSize: CGFloat = 14
    static let spacing: CGFloat = 4
    static let verticalPadding: CGFloat = 20
}

#Preview {
    GoBackLabel()
        .appBackground()
}
