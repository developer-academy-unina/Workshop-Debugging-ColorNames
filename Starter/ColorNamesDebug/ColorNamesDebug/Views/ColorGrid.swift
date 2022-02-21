//
//  ColorGrid.swift
//  ColorNamesDebug
//
//  Created by Vasily Martin for Developer Academy
//

import SwiftUI

struct ColorGrid: View {
    var hexColors: [String]
    @Binding var selectedHexColor: String

    private let columns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: 50)), count: 4)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 30) {
            ForEach(hexColors, id: \.self) { hexColor in
                if let color = Color(hex: hexColor) {
                    Circle()
                        .fill()
                        .foregroundColor(color)
                        .frame(width: 50, height: 50)
                        .onTapGesture {
                            selectedHexColor = hexColor
                        }
                }
            }
        }
    }
}

struct ColorGrid_Previews: PreviewProvider {
    static var previews: some View {
        ColorGrid(
            hexColors: ["#000000", "#FF0000", "#00FF00", "#0000FF", "#FFDDFF"],
            selectedHexColor: .constant("FFFF00")
        )
    }
}
