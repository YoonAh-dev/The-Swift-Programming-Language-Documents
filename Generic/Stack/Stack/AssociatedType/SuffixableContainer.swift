//
//  SuffixableContainer.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/16.
//

import Foundation

protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}
