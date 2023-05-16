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


// Stack<String>과의 비교를 위해서 Array가 Container를 준수하도록 합니다.

extension Array: Container { }

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")

var arrayOfStrings = ["uno", "dos", "tres"]

if allItemsMatch(stackOfStrings, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}

if stackOfStrings.startsWith("dos") {
    print("dos로 시작")
} else {
    print("아니지롱")
}

