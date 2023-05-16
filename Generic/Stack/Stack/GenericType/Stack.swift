//
//  Stack.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/15.
//

import Foundation

struct Stack<Element: Equatable>: Container {

    // MARK: - property

    var items: [Element] = []

    var count: Int {
        return items.count
    }

    subscript(i: Int) -> Element {
        return items[i]
    }

    // MARK: - func

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element {
        return items.removeLast()
    }

    mutating func append(_ item: Element) {
        self.push(item)
    }
}

extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }

    func findIndex(of valueToFind: Element) -> Int? {
        for (index, value) in items.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
}
