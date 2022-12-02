//
//  Round.swift
//  Right on target
//
//  Created by Artem Alekseev on 21.11.2022.
//

import UIKit

protocol GameRoundProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    func calculateScore(with num: Int) -> Void
}

class GameRound: GameRoundProtocol {
    var currentSecretValue = 0
    var score = 0
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    
    func calculateScore(with num: Int) {
        num != self.currentSecretValue ? (self.score += (50 - num)) : (self.score += 50)
    }
}
