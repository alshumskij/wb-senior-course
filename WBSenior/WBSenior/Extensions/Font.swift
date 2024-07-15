//
//  Font.swift
//  WBSenior
//
//  Created by Alexander Shumskiy on 04.07.2024.
//

import SwiftUI

extension Font {
    static func regular(_ size: CGFloat) -> Font {
        .custom("Montserrat-Regular", size: size)
    }
    
    static func medium(_ size: CGFloat) -> Font {
        .custom("Montserrat-Medium", size: size)
    }
    
    static func semiBold(_ size: CGFloat) -> Font {
        .custom("Montserrat-SemiBold", size: size)
    }
    
    static func bold(_ size: CGFloat) -> Font {
        .custom("Montserrat-Bold", size: size)
    }
}
