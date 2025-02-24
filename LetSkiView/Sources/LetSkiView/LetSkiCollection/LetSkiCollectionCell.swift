//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 13.02.2025.
//

import SwiftUI

struct LetSkiCollectionCell: View {
    let item: String
    let image: Image
    
    var body: some View {
        ZStack() {
            Color("background-main", bundle: .module).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                HStack {
                    image
                        .frame(width: 25, height: 25)
                    Spacer()
                    
                }
                .padding(.leading, 10)
                .padding(.top, 10)
                
                HStack {
                    Text(item)
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
