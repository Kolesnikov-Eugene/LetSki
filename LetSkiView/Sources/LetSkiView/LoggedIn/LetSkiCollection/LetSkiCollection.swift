//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 12.02.2025.
//

import SwiftUI

struct LetSkiCollection: View {
    @EnvironmentObject var coordinator: AnyCoordinator
    var columns = [GridItem(.flexible()), GridItem(.flexible())] // 2 flexible rows
    var category: String
    var data: [LetSkiMenuItem]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(.headline)
                .foregroundStyle(.primary)
                .padding(.leading, 10)
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(data, id: \.self) { item in
                    LetSkiCollectionCell(item: item.name, image: item.image)
                        .frame(minWidth: 80, maxWidth: .infinity, minHeight: 150) // Flexible cell width
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .onTapGesture {
                            coordinator.push(.chooseSki(item.name))
                        }
                }
            }
        }
    }
}

//#Preview {
//    LetSkiCollection(data: ["1", "2", "3", "4", "5"])
//}
