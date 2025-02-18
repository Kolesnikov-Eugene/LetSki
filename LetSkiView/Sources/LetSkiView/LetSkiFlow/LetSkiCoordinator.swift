//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI
import Combine

public protocol LetSkiCoordinatorProtocol: ObservableObject, AnyObject {
    // MARK: - Properties
    var path: NavigationPath { get set }
    var pathPublisher: AnyPublisher<NavigationPath, Never> { get }
    
    // MARK: - Methods
    func push(_ destination: LetSkiDestination)
    func pop()
    func popToRoot()
}

final public class LetSkiCoordinator: LetSkiCoordinatorProtocol {
    
    // MARK: - Public properties
    @Published public var path: NavigationPath = NavigationPath()
    public var pathPublisher: AnyPublisher<NavigationPath, Never> {
        $path
            .eraseToAnyPublisher()
    }
    
    // MARK: - Lifecycle
    public init() {}
    
    // MARK: - Public methods
    public func push(_ destination: LetSkiDestination) {
        path.append(destination)
    }
    
    public func pop() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeLast(path.count)
    }
}
