//
//  Container.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/16.
//

import Foundation

protocol Container {
    associatedtype Item

    var count: Int { get }
    subscript(i: Int) -> Item { get }
    mutating func append(_ item: Item)
}

extension Container  {
    func startsWith(_ item: Item) -> Bool where Item: Equatable {
        return count >= 1 && self[0] == item
    }

    func average() -> Double where Item == Double {
        var sum = 0.0
        for index in 0..<count {
            sum += self[index]
        }
        return sum / Double(count)
    }
}
