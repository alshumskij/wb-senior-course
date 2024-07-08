//
//  RequestAgainLabel.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 07.07.2024.
//

import SwiftUI
import Combine

struct RequestAgainLabel: View {
    @State
    private var timeRemaining: Int = .timeRemainingDefault

    @State
    private var isRequestAgainTitleHidden = false
    
    private let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    
    init(timer: Publishers.Autoconnect<Timer.TimerPublisher>) {
        self.timer = timer
    }
    
    var body: some View {
        Text("Request again in \(timeRemaining) seconds")
            .foregroundStyle(.white)
            .font(.regular(.requestAgainFontSize))
            .padding(.requestAgainInsets)
            .hidden(isRequestAgainTitleHidden)
            .onReceive(timer) { input in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                } else {
                    isRequestAgainTitleHidden = true
                }
            }
    }
}

private extension EdgeInsets {
    static let requestAgainInsets = EdgeInsets(top: 15, leading: 0, bottom: 24, trailing: 0)
}

private extension CGFloat {
    static let requestAgainFontSize: CGFloat = 14
}

private extension Int {
    static let timeRemainingDefault: Int = 60
}

#Preview {
    RequestAgainLabel(timer: Timer.publish(every: 1, on: .main, in: .common).autoconnect())
        .appBackground()
}
