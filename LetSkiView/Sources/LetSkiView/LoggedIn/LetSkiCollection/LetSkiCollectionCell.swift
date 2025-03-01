//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 13.02.2025.
//

import SwiftUI

struct LetSkiCollectionCell: View {
    let item: LetSkiMenuItem
    
    var body: some View {
        ZStack() {
            Color("cell-background", bundle: .module).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    item.image
                        .foregroundStyle(Color("tint-main", bundle: .module))
                        .frame(width: 25, height: 25)
                    Text(item.itemName)
                        .font(.headline)
                    Spacer()
                    
                }
                .padding(.leading, 10)
                .padding(.top, 10)
                
                HStack {
                    Text(item.desscription)
                        .font(.subheadline)
                        .fontWeight(.thin)
                }
                .padding(.leading, 10)
                .padding(.top, 10)
                Spacer()
            }
        }
    }
}

//#Preview {
//    LetSkiCollectionCell(item: "Test")
//}
