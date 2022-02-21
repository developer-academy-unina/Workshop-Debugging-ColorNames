//
//  Color+Hex.swift
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI


extension Color {
    /// Creates a constant color from hexadecimal number
    /// ```
    /// let red = Color(hex: 0xFF0000)
    /// ```
    /// - Parameters:
    ///   - hex: A hexadecimal representation of the color
    ///   - opacity: An optional degree of opacity, given in the range 0 to 1. The default is 1.
    init(hex: UInt, opacity: Double = 1) {
        let red = Double((hex & 0xFF0000) >> 16) / 255
        let green = Double((hex & 0x00FF00) >> 8) / 255
        let blue = Double(hex & 0x0000FF) / 255
        self.init(red: red, green: green, blue: blue, opacity: opacity)
    }

    init?(hex: String, opacity: Double = 1) {
        guard
            let hexValue = UInt(String(hex.suffix(6)), radix: 16)
        else {
            return nil
        }
        self.init(hex: hexValue, opacity: opacity)
    }
}
