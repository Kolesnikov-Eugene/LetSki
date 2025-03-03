//
//  LetSkiCore.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 03.03.2025.
//

import SwiftUI
import ComposableArchitecture


@Reducer
public struct LetSkiMain {
    @ObservableState
    public struct State: Equatable {
        public var isLoading: Bool = false
        public var loaded: Bool = false
        public var error: String?
        public var skiCount: Int = 0
        
        public init() {}
    }
    
    public enum Action {
        case loadSki
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadSki:
                state.skiCount += 1
                state.loaded = true
                return .none
            }
        }
    }
}

//extension LetSkiCore.State: Equatable {}
