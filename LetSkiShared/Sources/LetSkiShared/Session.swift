//
//  Session.swift
//  LetSkiShared
//
//  Created by Eugene Kolesnikov on 25.02.2025.
//

import Foundation
import SwiftUI

public class Session: ObservableObject {
    @Published public var loggedIn: Bool = false
    
    public var needsLogIn: Bool {
        !loggedIn
    }
    
    public init() {}
}
