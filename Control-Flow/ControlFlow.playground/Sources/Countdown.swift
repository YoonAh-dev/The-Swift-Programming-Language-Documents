import UIKit

struct CountdownIterator: IteratorProtocol {
    let countdown: Countdown
    var times = 0

    init(_ countdown: Countdown) {
        self.countdown = countdown
    }

    mutating func next() -> Int? {
        let nextNumber = countdown.start - times
        guard nextNumber >= 0 else { return nil }

        times += 1
        return nextNumber
    }
}

struct Countdown: Sequence {
    let start: Int

    func makeIterator() -> CountdownIterator {
        return CountdownIterator(self)
    }
}

/// Sequence와 IteratorProtocol을 한 번에 준수한 구조체
//struct Countdown: Sequence, IteratorProtocol {
//    let start: Int
//    var times = 0
//
//    mutating func next() -> Int? {
//        let nextNumber = start - times
//        guard nextNumber >= 0 else { return nil }
//
//        times += 1
//        return nextNumber
//    }
//}

//let count = Countdown(start: 10)
//for i in count {
//    print(i, terminator: " ")
//}
