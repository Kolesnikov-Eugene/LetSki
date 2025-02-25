//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI
import ComposableArchitecture
import LetSkiShared


public struct Item: Hashable {
    let id: UUID
    let name: String
}

public enum LetSkiMainState {
    case loading
    case loaded
    case failed(Error)
}

public struct LetSkiMainView: View {
    
    // MARK: - Private properties
    @StateObject private var coordinator: AnyCoordinator
    @EnvironmentObject public var loggedInState: Session
    private let factory: LetSkiFactory
    
    // MARK: - Public properties
    let columns = [GridItem(.flexible(minimum: 100))]
    private let data: LetSkiItemModel = LetSkiItemModel()
    
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
                        ForEach(data.categories.keys.sorted(), id: \.self) { key in
                            LetSkiCollection(category: key, data: data.categories[key] ?? [])
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
