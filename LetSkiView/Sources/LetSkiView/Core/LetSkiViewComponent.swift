//
//  LetSkiViewDependency.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 19.02.2025.
//

import NeedleFoundation
import SwiftUI

public protocol LetSkiViewDependency: Dependency {}

@MainActor
public protocol LetSkiViewBuilder {
    var letSkiView: AnyView { get }
}

public class LetSkiViewComponent: Component<LetSkiViewDependency>, LetSkiViewBuilder {
    public var letSkiView: AnyView {
        AnyView(LetSkiMainView(factory: letSkiFactory))
    }
    
    private var letSkiFactory: LetSkiFactory {
        LetSkiFactory()
    }
}
