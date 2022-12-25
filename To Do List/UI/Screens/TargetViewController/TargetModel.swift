//
//  TargetModel.swift
//  To Do List
//
//  Created by Алексей Артамонов on 24.12.2022.
//

import Foundation

struct Target: Codable {
    let name: String
    let priority: Priority
    let date: String
}

enum Priority: String, Codable {
    case low = "Низкий"
    case medium = "Средний"
    case high = "Высокий"
    case extraHigh = "Очень высокий"
}
