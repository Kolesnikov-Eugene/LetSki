//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation
import SwiftUI
import Combine

public protocol LetSkiCoordinatorProtocol: ObservableObject, AnyObject {
    var path: NavigationPath { get set }
    
    func push(_ destination: LetSkiDestination)
    func pop()
    func popToRoot()
}

final public class LetSkiCoordinator: LetSkiCoordinatorProtocol {
    @Published public var path: NavigationPath = NavigationPath()
    
    public init() {}
    
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

public final class AnyCoordinator: ObservableObject {
    private let _push: (LetSkiDestination) -> Void
    private let _pop: () -> Void
    private let _popToRoot: () -> Void
    private var cancellables = Set<AnyCancellable>()
    
    @Published public var path: NavigationPath = NavigationPath()
    private var coordinator: any LetSkiCoordinatorProtocol
    
    public init<T: LetSkiCoordinatorProtocol>(_ coordinator: T) {
        self._push = coordinator.push
        self._pop = coordinator.pop
        self._popToRoot = coordinator.popToRoot
        self.coordinator = coordinator
        
        // 🔥 Observe and sync path changes
        if let observableCoordinator = coordinator as? LetSkiCoordinator {
            observableCoordinator.$path
                .receive(on: DispatchQueue.main)
                .sink { [weak self] newPath in
                    self?.path = newPath
                }
                .store(in: &cancellables)
        }
    }
    
    public func push(_ destination: LetSkiDestination) { _push(destination) }
    public func pop() { _pop() }
    public func popToRoot() { _popToRoot() }
}
