//
//  SplashScreenView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 19.02.2025.
//

import SwiftUI

struct SplashScreenView: View {
    
    var body: some View {
        ZStack {
            Color("main-background", bundle: .main).ignoresSafeArea()
            Image("anim")
                .resizable()
                .scaledToFit()
        }
    }
}

//#Preview {
//    SplashScreenView()
//}

//else if isActive && !loggedInState.loggedIn {
//   viewBuilder.logInView
//       .transition(.opacity)
//       .environmentObject(loggedInState)
//}
