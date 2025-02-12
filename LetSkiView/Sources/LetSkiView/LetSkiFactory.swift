//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation
import SwiftUI

//protocol LetSkiFactoryProtocol {
//    associatedtype DestinationView: View
//    
//    @MainActor
//    func makeView(for destination: LetSkiDestination, item: String) -> DestinationView
//}

//public protocol LetSkiFactoryProtocol {
//    associatedtype SkiView: some View
//    func makeView(
//        for destination: LetSkiDestination,
//        item: String
//    ) -> any View
//    func makeCoordinator() -> LetSkiCoordinator
////    func makeLetSkiViewModel() -> any LetSkiViewModelProtocol
//}

public final class LetSkiFactory {
    
    public init() {}
    
    @MainActor
    public func makeView(for destination: LetSkiDestination) -> some View {
        switch destination {
        case .chooseSki(let item):
            ChooseSkiView(item: item)
        case .myInventory(let item):
            ChooseSkiView(item: item)
        case .prepare(let item):
            ChooseSkiView(item: item)
        case .diary(let item):
            ChooseSkiView(item: item)
        }
    }
    
    public func makeCoordinator() -> LetSkiCoordinator {
        LetSkiCoordinator()
    }
}

