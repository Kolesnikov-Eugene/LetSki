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
//    @StateObject private var coordinator: LetSkiCoordinator
    @StateObject private var coordinator: AnyCoordinator
    private let factory = LetSkiFactory()
    let columns = [GridItem(.flexible(minimum: 100))]
    let data = ["1", "2", "3"]
    
    public init(factory: LetSkiFactoryProtocol) {
        let coor = AnyCoordinator(factory.makeCoordinator())
        _coordinator = StateObject(wrappedValue: coor)
    }
    
//    public init(factory: LetSkiFactoryProtocol) {
//        _coordinator = StateObject(wrappedValue: factory.makeCoordinator())
//    }
    
    public var body: some View {
        NavigationStack(path: $coordinator.path) {
            LazyVGrid(columns: columns, content: {
                ForEach(data, id: \.self) { item in
                    Label("Let's ski! \(item)", systemImage: "snow")
                        .onTapGesture {
                            coordinator.push(.chooseSki)
                        }
                    Spacer()
                }
            })
//            .navigationTitle("This is a SKI")
//            .toolbar {
//                ToolbarItem(placement: .topBarLeading) {
//                    Button("Back") {
//                        coordinator.path.removeLast()
//                    }
//                }
//            }
            .navigationDestination(for: LetSkiDestination.self) { destination in
                factory.makeView(for: destination)
            }
        }
    }
}

//#Preview {
//    LetSkiMainView()
//}
