

import LetSkiView
import MapView
import NeedleFoundation
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class MapViewDependencya82bc19558e51cad91aeProvider: MapViewDependency {


    init() {

    }
}
/// ^->RootComponent->MapViewComponent
private func factory15962e156c94c97cb5a3e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MapViewDependencya82bc19558e51cad91aeProvider()
}

#else
extension RootComponent: NeedleFoundation.Registration {
    public func registerItems() {

        localTable["rootView-some View"] = { [unowned self] in self.rootView as Any }
        localTable["mapViewComponent-MapViewComponent"] = { [unowned self] in self.mapViewComponent as Any }
    }
}
extension MapViewComponent: NeedleFoundation.Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

@inline(never) private func register1() {
    registerProviderFactory("^->RootComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->RootComponent->MapViewComponent", factory15962e156c94c97cb5a3e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}
