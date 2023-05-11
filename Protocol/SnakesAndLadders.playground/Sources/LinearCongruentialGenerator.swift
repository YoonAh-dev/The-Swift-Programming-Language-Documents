import Foundation

public protocol RandomNumberGenerator {
    func random() -> Double
}

public class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom: Double = 42.0
    let m: Double = 139968.0
    let a: Double = 3877.0
    let c: Double = 29573.0

    public init() { }

    public func random() -> Double {
        self.lastRandom = ((self.lastRandom * a + c)
            .truncatingRemainder(dividingBy: self.m))
        return self.lastRandom / self.m
    }
}
