//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation

protocol LetSkiViewModelProtocol: ObservableObject {
    
}

final class LetSkiViewModel: LetSkiViewModelProtocol {
    private let coordinator: LetSkiCoordinator
    
    init(coordinator: LetSkiCoordinator) {
        self.coordinator = coordinator
    }
}
