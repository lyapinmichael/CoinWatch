//
//  SettingsView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    private var themeMessage: String {
        if colorScheme == .light {
            return "LightTheme".localized
        } else {
            return "DarkTheme".localized
        }
    }
    
    @Binding var isTitleOn: Bool
    
    @State var selectedCurrency = "USD"
    @State var sliderValue = 0.5
    
    var currencies = ["USD", "EUR", "RUB", "BYN"]
    
    var body: some View {
        Form {
            Section("Theme") {
                Text(themeMessage)
            }
            
            Section("Options") {
                Toggle("NaviagtionTitle".localized, isOn: $isTitleOn)
                Text(isTitleOn ? "NavigationTitleOn".localized : "NavigationTitleOff".localized)
                
                Picker("Preferred fiat currency", selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                Slider(value: $sliderValue)
            
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isTitleOn: .constant(false))
    }
}
