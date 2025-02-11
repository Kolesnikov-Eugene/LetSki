//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation
import SwiftUI

public protocol LetSkiFactoryProtocol {
//    associatedtype SkiView: some View
    func makeView(for destination: LetSkiDestination) -> AnyView
    func makeCoordinator() -> LetSkiCoordinator
//    func makeLetSkiViewModel() -> any LetSkiViewModelProtocol
}

public final class LetSkiFactory: LetSkiFactoryProtocol {
    
    public init() {}
    
    public func makeView(for destination: LetSkiDestination) -> AnyView {
        switch destination {
        case .chooseSki:
            return AnyView(ChooseSkiView())
        case .myInventory:
            return AnyView(ChooseSkiView())
        case .prepare:
            return AnyView(ChooseSkiView())
        case .diary:
            return AnyView(ChooseSkiView())
        }
    }
    
    public func makeCoordinator() -> LetSkiCoordinator {
        LetSkiCoordinator()
    }
    
//    public func makeLetSkiViewModel() -> any LetSkiViewModelProtocol {
//        return nil
//    }
}

