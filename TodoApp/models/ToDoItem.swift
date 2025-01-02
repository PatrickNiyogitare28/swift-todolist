//
//  ToDoItem.swift
//  TodoApp
//
//  Created by Patrick Niyo on 02/01/2025.
//

import Foundation
import SwiftData

@Model
final class ToDoItem {
    var title: String
    var isCompleted: Bool
    
    init(
        title: String = "",
        isCompleted: Bool = false
    ){
        self.title = title
        self.isCompleted = isCompleted
    }
}

extension Bool: @retroactive Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        !lhs && rhs
    }
}
