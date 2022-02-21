//
//  ContentView.swift
//  ColorNamesDebug
//
//  Created by Vasily Martin for the Developer Academy
//

import SwiftUI

struct ContentView: View {
    @StateObject var colorStore = ColorStore()
    @State private var selectedHexColor = "#FFFFFF"
    @State private var selectedColorName = "White"
    
    private var selectedColor: Color {
        Color(hex: selectedHexColor) ?? .white
    }
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 50)
                    .foregroundColor(selectedColor)
                    .frame(height: 250)
                    .padding()
                Text(selectedColorName)
                    .font(.title)
            }
            
            Spacer()
            
            ColorGrid(
                hexColors: colorStore.hexColors,
                selectedHexColor: $selectedHexColor
            )
        }
        .onChange(of: selectedHexColor) { _ in
            Task {
                let colorName = try await colorStore.fetchColorName(for: selectedHexColor)
                selectedColorName = colorName
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
