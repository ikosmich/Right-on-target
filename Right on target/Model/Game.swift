//
//  Game.swift
//  Right on target
//
//  Created by Artem Alekseev on 20.11.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var numberGenerator: NumberGeneratorProtocol { get }
    var isGameEnded: Bool { get }
    var round: GameRoundProtocol! { get }
    func restartGame()
    func startNewRound()
}

class Game: GameProtocol {
    private var rounds: [GameRoundProtocol] = []
    var score: Int {
        var totalScore = 0
        for round in self.rounds {
            totalScore += round.score
            print("\(round.score)")
        }
        print("rounds count - \(rounds.count)")
        return totalScore
    }
    var numberGenerator: NumberGeneratorProtocol
    var round: GameRoundProtocol!
    private var roundCount: Int
    var isGameEnded: Bool {
        roundCount == rounds.count ? true : false
    }
    
    init(numberGenerator: NumberGeneratorProtocol, rounds: Int) {
        self.numberGenerator = numberGenerator
        self.roundCount = rounds
        startNewRound()
    }
    
    func restartGame() {
        self.rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewValue()
        round = GameRound(secretValue: newSecretValue)
        self.rounds.append(round)
    }
    
    private func getNewValue() -> Int {
        numberGenerator.getRandomValue()
    }
}
