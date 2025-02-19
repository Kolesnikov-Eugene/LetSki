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
    let mapViewBuilder: MapViewBuilder
    let letSkiViewBuilder: LetSkiViewBuilder
    
    var body: some View {
        TabView(selection: $selectedTab) {
            letSkiViewBuilder.letSkiView
                .background(Color("splash").ignoresSafeArea())
                .tabItem {
                    Label(
                        "LetSKi",
                        systemImage: "figure.skiing.crosscountry.circle"
                    )
                }
                .tag(TabItem.ski)
            mapViewBuilder.mapView
                .tabItem {
                    Label(
                        "Map",
                        systemImage: "map"
                    )
                }
                .tag(TabItem.map)
        }
        .background(Color("splash").ignoresSafeArea())
        .tint(.blue)
    }
}

//#Preview {
//    ContentView()
//}
