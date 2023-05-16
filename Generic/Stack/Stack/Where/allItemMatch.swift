//
//  allItemMatch.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/16.
//

import Foundation

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {

    if someContainer.count != anotherContainer.count {
        return false
    }

    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }

    return true
}
