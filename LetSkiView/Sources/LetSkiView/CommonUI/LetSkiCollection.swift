//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 12.02.2025.
//

import SwiftUI

struct LetSkiCollection: View {
    @EnvironmentObject var coordinator: AnyCoordinator
    private var rows = [GridItem(.adaptive(minimum: 100))]
    private var data = ["One", "Two", "Three", "Four", "Five"]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(data, id: \.self) { item in
                    ChooseSkiView(item: item)
                        .onTapGesture {
                            coordinator.push(.chooseSki(item))
                        }
                }
            }
        }
    }
}

//#Preview {
//    LetSkiCollection()
//}
