//
//  ContentView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 03.02.2025.
//

import SwiftUI
import LetSkiView
import MapView

enum TabItem: Hashable {
    case ski
    case map
}

struct ContentView: View {
    @State private var selectedTab: TabItem = .ski
    
    var body: some View {
        TabView(selection: $selectedTab) {
            LetSkiView()
                .tabItem {
                    Label(
                        "LetSKi",
                        systemImage: "figure.skiing.crosscountry.circle"
                    )
                }
                .tag(TabItem.ski)
            MapView()
                .tabItem {
                    Label(
                        "Map",
                        systemImage: "map"
                    )
                }
                .tag(TabItem.map)
        }
        .tint(.blue)
    }
}

#Preview {
    ContentView()
}
