//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation
import SwiftUI

final public class LetSkiCoordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    
    public init() {}
    
    func push(_ destination: LetSkiDestination) {
        path.append(destination)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
