//
//  SkiViewCell.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 17.02.2025.
//

import SwiftUI

struct SkiViewCell: View {
    var ski: Ski
    
    var body: some View {
        HStack {
            Image(systemName: "skis")
                .resizable()
                .frame(width: 30, height: 30)
            VStack {
                Text(ski.name)
                Text(ski.structure)
            }
            Spacer()
            Image(systemName: "chevron.forward")
                .resizable()
                .frame(width: 15, height: 20)
                .foregroundStyle(.gray)
        }
    }
}

//#Preview {
//    SwiftUIView()
//}
