//
//  IntStack.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/15.
//

import Foundation

struct IntStack: Container {

    // MARK: - property

    var count: Int {
        return items.count
    }

    var items: [Int] = []

    subscript(i: Int) -> Int {
        return items[i]
    }

    // MARK: - func

    mutating func push(_ item: Int) {
        items.append(item)
    }

    mutating func pop() -> Int {
        return items.removeLast()
    }

    mutating func append(_ item: Int) {
        self.push(item)
    }
}

extension IntStack: SuffixableContainer {
    func suffix(_ size: Int) -> Stack<Int> {
        var result = Stack<Int>()

        for index in (count - size)..<count {
            result.append(self[index])
        }

        return result
    }
}
