//
//  LogInView.swift
//  LetSki
//
//  Created by Eugene Kolesnikov on 24.02.2025.
//

import SwiftUI

class Session: ObservableObject {
    @Published var loggedIn: Bool = false
}

struct LogInView: View {
    @EnvironmentObject var loggedInState: Session
    var body: some View {
        VStack {
            Text("Please, log in")
            Button("Log In") {
                loggedInState.loggedIn = true
            }
            .padding()
        }
    }
}

#Preview {
    LogInView()
}
