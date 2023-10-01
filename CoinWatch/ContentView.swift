//
//  ContentView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
            
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "globe")
                }
            
            SettingsView()
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
