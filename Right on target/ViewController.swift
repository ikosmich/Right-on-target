//
//  ViewController.swift
//  Right on target
//
//  Created by Artem Alekseev on 20.11.2022.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Game lifecyrcle
    
    var game: Game!
    var generator: NumberGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generator = NumberGenerator()
        game = Game(numberGenerator: generator, rounds: 5) // Game init
        self.label.text = String(game.round.currentSecretValue) // Updating label text before view apear
    }
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    @IBAction func checkNumber() {
        let sliderNum = Int(self.slider.value.rounded())
        game.round.calculateScore(with: sliderNum)
        if game.isGameEnded {
            endGameAlert()
        }
        game.startNewRound()
        updateLabelText()
    }
    
    @IBAction func restartGameButton() {
        restartAlert()
    }
    
    // MARK: - Restart game alert, end game alert, scene update
    
    private func restartAlert() -> Void {
        let questionAlert = UIAlertController(title: "Restart?", message: "Choose answer", preferredStyle: .alert)
        let yesButton = UIAlertAction(title: "Yes", style: .destructive, handler: { _ in self.game.restartGame()
            self.updateLabelText() })
        let noButton = UIAlertAction(title: "No", style: .cancel)
        questionAlert.addAction(noButton)
        questionAlert.addAction(yesButton)
        self.present(questionAlert, animated: true)
    }
    
    private func endGameAlert() -> Void {
        let endGameAlert = UIAlertController(title: "Game was finished", message: "You earned \(game.score) points!", preferredStyle: .alert)
        let buttonOK = UIAlertAction(title: "COOL!", style: .default, handler: { _ in self.game.restartGame()})
        endGameAlert.addAction(buttonOK)
        self.present(endGameAlert, animated: true)
    }
    
    private func updateLabelText() -> Void {
        self.label.text = String(game.round.currentSecretValue)
    }
    
    // MARK: - SECOND SCENE SEGUE
    private func getSecondViewController() -> SecondViewController {
        //Storyboard load
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //View controller loading from storyboard
        let vc = storyboard.instantiateViewController(identifier: "SVC")
        //Scene showing on screen
        return vc as! SecondViewController
    }
    
    lazy var secondVC: SecondViewController = getSecondViewController()
    
    @IBAction func nextScene() -> Void {
        self.present(secondVC, animated: true)
    }
}
