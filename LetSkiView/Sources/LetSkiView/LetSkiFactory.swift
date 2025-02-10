//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation
import SwiftUI

protocol LetSkiFactoryProtocol {
//    associatedtype SkiView: some View
    func makeView(for destination: LetSkiDestination) -> AnyView
}

final class LetSkiFactory: LetSkiFactoryProtocol {
    init() {}
    
    func makeView(for destination: LetSkiDestination) -> AnyView {
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
}

