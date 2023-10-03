//
//  ContentView.swift
//  CoinWatch
//
//  Created by Ляпин Михаил on 01.10.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isTitleOn: Bool = true
    
    var body: some View {
        TabView {
            InfoView(isTitleOn: isTitleOn)
                .tabItem {
                    Label("Info", systemImage: "info.circle")
                }
                
            
            HelloView()
                .tabItem {
                    Label("Hello", systemImage: "globe")
                }
            
            SettingsView(isTitleOn: $isTitleOn)
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
