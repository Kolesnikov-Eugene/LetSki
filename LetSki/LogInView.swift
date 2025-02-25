//
//  LogInView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 24.02.2025.
//

import SwiftUI
import LetSkiShared


struct LogInView: View {
    @EnvironmentObject var loggedInState: Session
    var body: some View {
        VStack {
            Text("Please, log in")
            Button("Log In") {
                loggedInState.loggedIn = true
            }
            Button("Stay private") {
                loggedInState.loggedIn = false
            }
            .padding()
        }
    }
}

#Preview {
    LogInView()
}
