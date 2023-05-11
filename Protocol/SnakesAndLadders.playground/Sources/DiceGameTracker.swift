import Foundation

final public class DiceGameTracker: DiceGameDelegate {
    var numberOfTurns: Int = 0

    public init() { }

    public func gameDidStart(_ game: DiceGame) {
        self.numberOfTurns = 0

        if game is SnakesAndLadders {
            print("🐍 Snakes and Ladders 🪜 게임을 시작합니다.")
        }

        print("🎲 \(game.dice.sides)면을 가진 주사위를 사용해서 게임을 진행합니다.")
    }

    public func game(_ game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        self.numberOfTurns += 1
        print("🎲 \"\(diceRoll)\"")
    }

    public func gameDidEnd(_ game: DiceGame) {
        print("=========== 게임이 끝났습니다. ===========\n☑️ turns: \(numberOfTurns)")
    }
}
