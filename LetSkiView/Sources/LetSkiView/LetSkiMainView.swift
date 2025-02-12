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
//    private let factory = LetSkiFactory()
    
    // MARK: - Public properties
    let columns = [GridItem(.flexible(minimum: 100))]
    let data = ["1", "2", "3"]
    
    public init(factory: LetSkiFactory) {
        self.factory = factory
        let letSkiCoordinator = AnyCoordinator(factory.makeCoordinator())
        _coordinator = StateObject(wrappedValue: letSkiCoordinator)
    }
    
    // MARK: - View
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            VStack {
                LazyVGrid(columns: columns, content: {
                    ForEach(data, id: \.self) { item in
                        LetSkiCollection()
                            .padding(.init(top: 0, leading: 10, bottom: 0, trailing: 10))
                        Spacer()
                            
                    }
                })
                .toolbar(content: {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ProfileButton()
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Text("Let's ski!")
                    }
                })
                .navigationDestination(for: LetSkiDestination.self) { destination in
                    factory.makeView(for: destination)
                        .environmentObject(coordinator)
                }
            }
        }
        .environmentObject(coordinator)
    }
}

//#Preview {
//    LetSkiMainView()
//}
