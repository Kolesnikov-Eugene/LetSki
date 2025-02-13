//
//  SwiftUIView.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 12.02.2025.
//

import SwiftUI

struct ProfileButton: View {
    var body: some View {
        Button(action: {
            print("btn click")
        }) {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(.teal)
        }
    }
}

//#Preview {
//    SwiftUIView()
//}
