//
//  IntStack.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/15.
//

import Foundation

struct IntStack {
    var items: [Int] = []

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }
}
