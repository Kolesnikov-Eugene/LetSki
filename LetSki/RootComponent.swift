//
//  RootComponent.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 18.02.2025.
//

import NeedleFoundation
import SwiftUI
import LetSkiView
import MapView

public class RootComponent: BootstrapComponent {
    
    public var rootView: some View {
        ContentView(mapViewBuilder: mapViewComponent)
    }
    
    public var mapViewComponent: MapViewComponent {
        MapViewComponent(parent: self)
    }
    
//    var letSkiComponent: LetSkiComponent {
//        return LetSkiComponent(parent: self)
//    }
}
