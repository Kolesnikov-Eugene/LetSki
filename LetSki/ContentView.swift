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
//    @EnvironmentObject public var loggedInState: Session
    let mapViewBuilder: MapViewBuilder
    let letSkiViewBuilder: LetSkiViewBuilder
    
    var body: some View {
        TabView(selection: $selectedTab) {
            letSkiViewBuilder.letSkiView
//                .environmentObject(loggedInState)
//                .background(Color("splash").ignoresSafeArea())
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
//        .environmentObject(loggedInState)
//        .background(Color("splash").ignoresSafeArea())
        .tint(Color("items-background"))
    }
}

//#Preview {
//    ContentView()
//}
