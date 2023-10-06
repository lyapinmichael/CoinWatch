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
    @Binding var sliderValue: Double
    
    @State var selectedCurrency = "USD"
    
    
    var currencies = ["USD", "EUR", "RUB", "BYN"]
    
    var body: some View {
        Form {
            Section("Theme") {
                Text(themeMessage)
            }
            
            Section("Options") {
                
                VStack(alignment: .leading) {
                    Toggle("NaviagtionTitle".localized, isOn: $isTitleOn)
                    
                    Text(isTitleOn ? "NavigationTitleOn".localized : "NavigationTitleOff".localized)
                }
                
                Picker("PreferredFiat".localized, selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.menu)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("ListRowHeight".localized + ":")
                        Spacer()
                        Text(String(format: "%.f", sliderValue * 100))
                            .foregroundColor(.blue)
                    }
                    
                    
                    Slider(value: $sliderValue, in: 0.44...1)
                }
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(isTitleOn: .constant(false), sliderValue: .constant(0.5))
    }
}
