//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 13.02.2025.
//

import SwiftUI

struct LetSkiCollectionCell: View {
    let item: String
    
    var body: some View {
        ZStack {
            Color("background-main", bundle: .module).edgesIgnoringSafeArea(.all)
            VStack {
                Image(systemName: "snow")
                Text(item)
                Spacer()
            }
        }
    }
}

#Preview {
    LetSkiCollectionCell(item: "Test")
}
