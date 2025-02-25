//
//  RootView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 25.02.2025.
//

import SwiftUI
import LetSkiShared

struct RootView: View {
    
    // MARK: - Public Properties
    @State var isActive = false
    @EnvironmentObject var loggedInState: Session
    
    // MARK: - Private Properties
    private var viewBuilder: RootComponent
    
    // MARK: - Init
    init(viewBuilder: RootComponent) {
        self.viewBuilder = viewBuilder
    }
    
    // MARK: - Lifecycle
    var body: some View {
        ZStack {
            mainContent
//                .environmentObject(loggedInState)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isActive = true
                }
            }
        }
        .sheet(
            isPresented: Binding(
                get: { loggedInState.needsLogIn },
                set: { loggedInState.loggedIn = !$0 }
            ),
            content: {
                viewBuilder.logInView
//                    .environmentObject(loggedInState)
            }
        )
    }
    
    // MARK: - Computed Views
    @ViewBuilder
    private var mainContent: some View {
        if isActive {
            viewBuilder.contentView
//                .environmentObject(loggedInState)
                .transition(.opacity)
        } else {
            viewBuilder.splashView
                .transition(.opacity)
        }
    }
}
