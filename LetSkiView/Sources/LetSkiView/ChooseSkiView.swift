//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI

struct Ski: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let structure: String
}

struct ChooseSkiView: View {
    @EnvironmentObject private var coordinator: AnyCoordinator
    private let item: String
    private let skies: [Ski] = [
        Ski(name: "Madshus", structure: "7-4"),
        Ski(name: "Madshus", structure: "9-6"),
        Ski(name: "Rossignol", structure: "base")
    ]
    
    init(item: String) {
        self.item = item
    }
    
    var body: some View {
        List(skies, id: \.id) { ski in
            Button {
                coordinator.push(.skiDetail)
            } label: {
                SkiViewCell(ski: ski)
                    .foregroundStyle(.black) // FIXME: create font color for entire feature
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("My Skis")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    coordinator.pop()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.cyan)
                }
            }
        }
    }
}

//#Preview {
//    ChooseSkiView(item: "Hello")
//}
