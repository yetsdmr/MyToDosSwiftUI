//
//  ToDoItem.swift
//  MyToDosSwiftUI
//
//  Created by Yunus Emre Taşdemir on 23.06.2023.
//

import Foundation
import SwiftData

@Model
final class ToDoltem {
    var title: String
    var timestamp: Date
    var isCritical: Bool
    var isCompleted: Bool
    
    init(title: String = "",
         timestamp: Date = . now,
         isCritical: Bool = false,
         isCompleted: Bool = false) {
        self.title = title
        self.timestamp = timestamp
        self.isCritical = isCritical
        self.isCompleted = isCompleted
    }
}
