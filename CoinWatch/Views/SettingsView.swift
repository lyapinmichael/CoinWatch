//
//  SettingsView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isToggleOn: Bool = false
    @State var selectedCurrency = "USD"
    @State var sliderValue = 0.5
    
    var currencies = ["USD", "EUR", "RUB", "BYN"]
    
    var body: some View {
        Form {
            Section("Theme") {
                Toggle("Theme", isOn: $isToggleOn)
            }
            
            Section("Options") {
               
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
        SettingsView()
    }
}
