//
//  SplashScreenView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 19.02.2025.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @StateObject var loggedInState: Session
    var viewBuilder: RootComponent
    
    init(viewBuilder: RootComponent) {
        self.viewBuilder = viewBuilder
        _loggedInState = StateObject(wrappedValue: Session())
    }
    
    var body: some View {
        ZStack {
            if isActive && loggedInState.loggedIn {
                viewBuilder.rootView
                    .transition(.opacity)
            } else if isActive && !loggedInState.loggedIn {
                viewBuilder.logInView
                    .transition(.opacity)
                    .environmentObject(loggedInState)
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
