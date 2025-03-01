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
    let itemName: String
    let desscription: String
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
        LetSkiMenuItem(
            id: UUID(),
            itemName: "Мои лыжи",
            desscription: "Нет доступных лыж. Перейдите на экран настройки Вашего инвентаря",
            imageName: "skis",
            category: .inventory),
        LetSkiMenuItem(
            id: UUID(),
            itemName: "Подобрать лыжный инвентарь",
            desscription: "Подберите лыжи исходя из Ваших физическких показателей и уровня подготовки",
            imageName: "figure.skiing.crosscountry",
            category: .inventory),
        LetSkiMenuItem(
            id: UUID(),
            itemName: "Подготовить лыжи",
            desscription: "Получите рекомендации по подготовке лыж под текущие погодные условия и вид тренировки",
            imageName: "ruler",
            category: .service),
        LetSkiMenuItem(
            id: UUID(),
            itemName: "История подготовки",
            desscription: "У вас пока нет записей",
            imageName: "clock",
            category: .service),
        LetSkiMenuItem(
            id: UUID(),
            itemName: "Мой журнал",
            desscription: "Похоже, что Вы еще не тренировались",
            imageName: "chart.line.text.clipboard.fill",
            category: .trainings),
        LetSkiMenuItem(
            id: UUID(),
            itemName: "План тренировок",
            desscription: "Выберите оптимальный план тренировок исходя из Вашего уровня подготовки и желаемого результата",
            imageName: "calendar",
            category: .trainings)
    ]
    
    var categories: [String: [LetSkiMenuItem]] {
        Dictionary(
            grouping: letSki,
            by: { $0.category.rawValue }
        )
    }
}
