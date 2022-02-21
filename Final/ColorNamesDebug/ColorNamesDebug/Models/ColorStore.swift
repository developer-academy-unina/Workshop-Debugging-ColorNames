//
//  ColorStore.swift
//  ColorNamesDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

@MainActor
class ColorStore: ObservableObject {
    private let apiURL = URL(string: "https://mc3-color-names.herokuapp.com/colors")!

    let hexColors = [
        "#efdecd", "#ffbf00", "#faebd7", "#8db600", "#e9d66b",
        "#87a96b", "#ff9966", "#89cff0", "#ffe135", "#f4c2c2",
        "#9f8170", "#de5d83"]
    
    func fetchColorName(for hexColor: String) async throws -> String? {
        let path = hexColor.replacingOccurrences(of: "#", with: "")
        let url = apiURL.appendingPathComponent(path)
        let (data, _) = try await URLSession.shared.data(from: url)
        let colorName = try JSONDecoder().decode(ColorInfo.self, from: data)
        return colorName.name
    }
}
