//
//  ViewController.swift
//  RPS
//
//  Created by Brian Nejand on 10/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(forState: .start)
    }

    @IBAction func rockClicked(_ sender: Any) {
        scissorsButton.isHidden = true
        paperButton.isHidden = true
        
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        playGame(sign: .rock)
    }
        
    @IBAction func paperClicked(_ sender: Any) {
        rockButton.isHidden = true
        scissorsButton.isHidden = true
        
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        playGame(sign: .paper)
    }
    
    @IBAction func scissorsClicked(_ sender: Any) {
        rockButton.isHidden = true
        paperButton.isHidden = true
        
        rockButton.isEnabled = false
        scissorsButton.isEnabled = false
        paperButton.isEnabled = false
        playGame(sign: .scissors)
    }
    
    @IBAction func playAgainClicked(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    func updateUI (forState state: GameState) {

        if state == .start {
            statusLabel.text = "Ready to play RPS?"
        }
        
        switch state {
        case .start:
            statusLabel.text = "Ready to play RPS?"
            view.backgroundColor = .blue
            appSign.text = "🤖"
            rockButton.isHidden = false
            scissorsButton.isHidden = false
            paperButton.isHidden = false
            playAgainButton.isHidden = true
            rockButton.isEnabled = true
            scissorsButton.isEnabled = true
            paperButton.isEnabled = true
        case .win:
            statusLabel.text = "You Won!"
            view.backgroundColor = .green
        case .lose:
            statusLabel.text = " You lost 🙁"
            view.backgroundColor = .red
        case .draw:
            statusLabel.text = "Draw!"
            view.backgroundColor = .yellow
        }
    }
    
    func playGame(sign: Sign){
        let computerSign = randomSign()
              
        appSign.text = computerSign.emoji
        
        let gameState = sign.gameState(computerSign: computerSign)
        
        updateUI(forState: gameState)
        
        playAgainButton.isHidden = false
        playAgainButton.isEnabled = true
        
    }
    
    
}

