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
