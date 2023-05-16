//
//  main.swift
//  Stack
//
//  Created by SHIN YOON AH on 2023/05/14.
//

import Foundation

var intStack = Stack<Int>()
intStack.push(2)
intStack.push(3)

var stringStack = Stack<String>()
stringStack.push("hello")
stringStack.push("안녕하세요")

if let topItem = stringStack.topItem {
    print(topItem)
}

if let index = stringStack.findIndex(of: "hello!") {
    print(index)
} else {
    print("없습니다.")
}
