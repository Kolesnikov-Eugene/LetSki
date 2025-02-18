//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 12.02.2025.
//

import SwiftUI
import Combine

public final class AnyCoordinator: ObservableObject {
    
    // MARK: - Public properties
    @Published public var path: NavigationPath = NavigationPath()
    
    // MARK: - Private properties
    private let _push: (LetSkiDestination) -> Void
    private let _pop: () -> Void
    private let _popToRoot: () -> Void
    private var cancellables = Set<AnyCancellable>()
    private var coordinator: any LetSkiCoordinatorProtocol
    
    // MARK: - Lifecycle
    public init<T: LetSkiCoordinatorProtocol>(_ coordinator: T) {
        self._push = coordinator.push
        self._pop = coordinator.pop
        self._popToRoot = coordinator.popToRoot
        self.coordinator = coordinator
        
        // Observe and sync path changes
        coordinator.pathPublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] newPath in
                self?.path = newPath
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Public methods
    public func push(_ destination: LetSkiDestination) { _push(destination) }
    public func pop() { _pop() }
    public func popToRoot() { _popToRoot() }
}
