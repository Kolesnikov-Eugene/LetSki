//
//  LetSkiViewDependency.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 19.02.2025.
//

import NeedleFoundation
import SwiftUI
import ComposableArchitecture

public protocol LetSkiViewDependency: NeedleFoundation.Dependency {}

@MainActor
public protocol LetSkiViewBuilder {
    var letSkiView: AnyView { get }
    var letSkiLoadingView: AnyView { get }
    var errorView: AnyView { get }
}

public class LetSkiViewComponent: Component<LetSkiViewDependency>, LetSkiViewBuilder {
    private let store = Store(initialState: LetSkiMain.State()) {
        LetSkiMain()
    }
    public var letSkiView: AnyView {
        AnyView(LetSkiMainView(factory: letSkiFactory, store: store))
    }
    
    // Gradient animating view while fetching data
    public var letSkiLoadingView: AnyView {
        AnyView(LetSkiLoadingView())
    }
    
    // Error view with failed connection
    public var errorView: AnyView {
        AnyView(LetSkiErrorView())
    }
    
    private var letSkiFactory: LetSkiFactory {
        LetSkiFactory()
    }
}
