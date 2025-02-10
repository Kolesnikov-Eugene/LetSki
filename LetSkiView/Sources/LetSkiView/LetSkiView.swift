//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI
import ComposableArchitecture

struct Item: Hashable {
    let id: UUID
    let name: String
}

public struct LetSkiView: View {
    @StateObject private var coordinator = LetSkiCoordinator()
    private let factory = LetSkiFactory()
    let columns = [GridItem(.flexible(minimum: 100))]
    let data = ["1", "2", "3"]
    
    public init() {}
    
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

#Preview {
    LetSkiView()
}
