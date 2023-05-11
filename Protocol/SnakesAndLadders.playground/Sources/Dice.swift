import Foundation

public class Dice {
    public let sides: Int
    public let generator: RandomNumberGenerator

    public init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    public func roll() -> Int {
        return Int(self.generator.random() * Double(self.sides)) + 1
    }
}
