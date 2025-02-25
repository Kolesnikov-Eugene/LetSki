//
//  LetSkiMenuItem.swift
//  LetSkiView
//
//  Created by Eugene Kolesnikov on 24.02.2025.
//

import Foundation
import SwiftUI

struct LetSkiMenuItem: Hashable, Identifiable {
    let id: UUID
    let name: String
    let imageName: String
    
    var image: Image {
        Image(systemName: imageName)
    }
    
    var category: Category
    
    enum Category: String, CaseIterable, Codable {
        case inventory = "Инвентарь"
        case service = "Сервис"
        case trainings = "Тренировки"
    }
}

final class LetSkiItemModel {
    var letSki: [LetSkiMenuItem] = [
        LetSkiMenuItem(id: UUID(), name: "Мои лыжи", imageName: "skis", category: .inventory),
        LetSkiMenuItem(id: UUID(), name: "Подобрать", imageName: "figure.skiing.crosscountry", category: .inventory),
        LetSkiMenuItem(id: UUID(), name: "Подготовить лыжи", imageName: "ruler", category: .service),
        LetSkiMenuItem(id: UUID(), name: "Моя история", imageName: "clock", category: .service),
        LetSkiMenuItem(id: UUID(), name: "Мой журнал", imageName: "chart.line.text.clipboard.fill", category: .trainings),
        LetSkiMenuItem(id: UUID(), name: "План тренировок", imageName: "calendar", category: .trainings)
    ]
    
    var categories: [String: [LetSkiMenuItem]] {
        Dictionary(
            grouping: letSki,
            by: { $0.category.rawValue }
        )
    }
}
