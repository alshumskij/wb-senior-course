//
//  LinearGradient.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 01.07.2024.
//

import SwiftUI

extension LinearGradient {
    static let modalBackground = LinearGradient(
        colors: [
            Color.modalGradient1,
            Color.modalGradient2
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
