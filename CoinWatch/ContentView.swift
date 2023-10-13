//
//  ContentView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("titleState") var isTitleOn: Bool = true
    @AppStorage("rowHeight") var rowHeight: Double = 0.5
    
    var body: some View {
        TabView {
            InfoView(isTitleOn: isTitleOn, rowHeight: rowHeight)
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
                
            
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "globe")
                }
            
            SettingsView(isTitleOn: $isTitleOn, sliderValue: $rowHeight)
                .tabItem {
                    Label("Settins", systemImage: "gear")
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
