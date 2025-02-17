//
//  File.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 10.02.2025.
//

import SwiftUI

public enum LetSkiDestination: Hashable {
    case myInventory(String)
    case prepare(String)
    case chooseSki(String)
    case diary(String)
    case skiDetail
}

//enum DestinationView {
//    case chooseSki(ChooseSkiView)
//    case skiDetail(SkiDetailView)
//
//    @ViewBuilder
//    var body: some View {
//        switch self {
//        case .chooseSki(let view):
//            view
//        case .skiDetail(let view):
//            view
//        }
//    }
//}
