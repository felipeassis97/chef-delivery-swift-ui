//
//  Font+.swift
//  ChefDelivery
//
//  Created by Felipe Assis on 23/01/24.
//

import Foundation

import SwiftUI

extension Font {
    
    enum FontType: String {
        case nunito = "Nunito"
    }

    enum FontStyle: String {
        case bold = "-Bold"
        case medium = "-Medium"
        case regular = "-Regular"
        case semiBold = "-SemiBold"
    }
    
    static func customStyle(type: FontType, style: FontStyle, size: CGFloat, isScaled: Bool = true) -> Font {
        let fontName: String = type.rawValue + style.rawValue
        return Font.custom(fontName, size: size)
    }
}
