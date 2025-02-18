//
//  File.swift
//  MapView
//
//  Created by Eugene Kolesnikov on 18.02.2025.
//

import NeedleFoundation
import SwiftUI

public protocol MapViewDependency: Dependency {}

@MainActor
public protocol MapViewBuilder {
    var mapView: AnyView { get }
}

public class MapViewComponent: Component<MapViewDependency>, MapViewBuilder {
    
    public var mapView: AnyView {
        AnyView(MapView()) // Wrap MapView in AnyView
    }
}
