//
//  SplashScreenView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 19.02.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    var viewBuilder: RootComponent
    
    var body: some View {
        ZStack {
            if isActive {
                viewBuilder.rootView
                    .transition(.opacity)
            } else {
                ZStack {
                    Color("splash").ignoresSafeArea()
                    Image("ski-back")
                        .renderingMode(.original)
                }
                .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.5), value: isActive)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
    }
}

//#Preview {
//    SplashScreenView()
//}
