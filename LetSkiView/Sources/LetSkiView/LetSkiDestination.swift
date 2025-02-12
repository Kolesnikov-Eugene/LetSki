//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import Foundation

public enum LetSkiDestination: Hashable {
    case myInventory(String)
    case prepare(String)
    case chooseSki(String)
    case diary(String)
}
