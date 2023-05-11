import Foundation

final public class SnakesAndLadders: DiceGame {
    public var dice: Dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    let finalSquare: Int = 99
    var currentSquare: Int = 0
    var gameBoard: [Int]

    public weak var delegate: DiceGameDelegate?

    public init() {
        self.gameBoard = Array(repeating: 0, count: self.finalSquare + 1)

        self.gameBoard[03] = +08; self.gameBoard[06] = +11; self.gameBoard[09] = +09
        self.gameBoard[10] = +02; self.gameBoard[14] = -10; self.gameBoard[19] = -11
        self.gameBoard[22] = -02; self.gameBoard[24] = -08; self.gameBoard[30] = +05
        self.gameBoard[40] = -10; self.gameBoard[44] = +09; self.gameBoard[49] = +12
        self.gameBoard[59] = -04; self.gameBoard[62] = +03; self.gameBoard[65] = +19
        self.gameBoard[75] = +07; self.gameBoard[77] = +10; self.gameBoard[82] = -03
        self.gameBoard[88] = +05; self.gameBoard[89] = +03; self.gameBoard[90] = -10
        self.gameBoard[92] = +04; self.gameBoard[95] = -06;
    }

    public func play() {
        self.currentSquare = 0

        self.delegate?.gameDidStart(self)

        gameLoop: while self.currentSquare != self.finalSquare {
            print(prettyTextualDescription)
            
            let diceRoll = self.dice.roll()
            self.delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)

            switch self.currentSquare + diceRoll {
            case self.finalSquare:
                break gameLoop
            case let newSquare where newSquare > self.finalSquare:
                continue gameLoop
            default:
                self.currentSquare += diceRoll
                self.currentSquare += self.gameBoard[self.currentSquare]
            }

        }

        self.delegate?.gameDidEnd(self)
    }
}

extension SnakesAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var board: String = "\(textualDescription)\n================="

        self.gameBoard.enumerated().forEach { index, square in
            if index % 10 == 0 {
                board += "\n"
            }

            if self.currentSquare == index {
                board += "⬇️ "
            } else if index == 0 {
                board += "🔜 "
            } else if index == self.finalSquare {
                board += "🔚 "
            } else {
                switch square {
                case let ladder where ladder > 0:
                    board += "▲ "
                case let snake where snake < 0:
                    board += "▼ "
                default:
                    board += "○ "
                }
            }
        }

        board += "\n=================\n"

        return board
    }

    var textualDescription: String {
        return "🐍 Snake And Ladders 🪜"
    }
}
