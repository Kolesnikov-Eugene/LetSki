//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI
import ComposableArchitecture

public struct Item: Hashable {
    let id: UUID
    let name: String
}

public struct LetSkiMainView: View {
    
    // MARK: - Private properties
    @StateObject private var coordinator: AnyCoordinator
    private let factory: LetSkiFactory
    
    // MARK: - Public properties
    let columns = [GridItem(.flexible(minimum: 100))]
    let data = ["1", "2"]
    
    public init(factory: LetSkiFactory) {
        self.factory = factory
        let letSkiCoordinator = AnyCoordinator(factory.makeCoordinator())
        _coordinator = StateObject(wrappedValue: letSkiCoordinator)
    }
    
    // MARK: - View
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            ZStack {
                Color("splash").ignoresSafeArea()
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns) {
                        ForEach(data, id: \.self) { item in
                            LetSkiCollection(data: ["One", "Two", "Three", "Four", "Five"])
                                .padding(.init(top: 10, leading: 10, bottom: 0, trailing: 10))
                        }
                    }
                }
            }
            .toolbarBackground(Color("splash"), for: .navigationBar)
//            .toolbarBackground(.hidden, for: .automatic)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    ProfileButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Let's ski!")
                }
            }
            .navigationDestination(for: LetSkiDestination.self) { destination in
                factory.makeView(for: destination)
                    .environmentObject(coordinator)
            }
        }
        .environmentObject(coordinator)
    }
}

//#Preview {
//    LetSkiMainView()
//}
