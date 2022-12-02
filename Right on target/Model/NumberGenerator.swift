//
//  NumberGenerator.swift
//  Right on target
//
//  Created by Artem Alekseev on 21.11.2022.
//

import UIKit

protocol NumberGeneratorProtocol {
    func getRandomValue() -> Int
}

class NumberGenerator: NumberGeneratorProtocol {
    func getRandomValue() -> Int {
    return Int.random(in: 0...50)
    }
}
