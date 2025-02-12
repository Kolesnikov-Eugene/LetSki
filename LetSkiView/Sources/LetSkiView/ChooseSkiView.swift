//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI

struct ChooseSkiView: View {
    @EnvironmentObject private var coordinator: AnyCoordinator
    private let item: String
    
    init(item: String) {
        self.item = item
    }
    
    var body: some View {
        Text(item)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        coordinator.pop() // Custom back navigation
                    }) {
                        Label("Back", systemImage: "chevron.left")
                    }
                }
            }
    }
}

//#Preview {
//    ChooseSkiView(item: "Hello")
//}
