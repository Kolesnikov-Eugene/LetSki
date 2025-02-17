//
//  SkiDetailView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 17.02.2025.
//

import SwiftUI

struct SkiDetailView: View {
    @EnvironmentObject private var coordinator: AnyCoordinator
    
    var body: some View {
        Text("Chosed ski here")
            .navigationTitle("This is my ski")
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .onTapGesture {
                            coordinator.pop()
                        }
                }
            }
    }
}

//#Preview {
//    SkiDetailView()
//}
