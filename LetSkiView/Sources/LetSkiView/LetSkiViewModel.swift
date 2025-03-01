//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation

public protocol LetSkiViewModelProtocol: ObservableObject, AnyObject {
    
}

public final class LetSkiViewModel: LetSkiViewModelProtocol {
    private var coordinator: AnyCoordinator
    
    init(coordinator: AnyCoordinator) {
        self.coordinator = coordinator
    }
}
